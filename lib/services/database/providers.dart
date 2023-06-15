import 'package:hive_flutter/hive_flutter.dart';


class CloudNoteDatabase {
  final _database = Hive.box('cloudNotesPermanentDatabase');

  void setSecurePIN(String email, String pin) {
    _database.put('$email-pin', pin);
  }

  String getSecurePIN(String email) {
    return _database.get('$email-pin');
  }

  void createNoteEmail(String email, String id) {
    _database.put('$email-$id-email', email);
  }

  void createNoteId(String email, String id) {
    _database.put('$email-$id-id', id);
  }

  void createNoteTitle(String email, String id, String title) {
    _database.put('$email-$id-title', title);
  }

  void createNoteBody(String email, String id, String body) {
    _database.put('$email-$id-body', body);
  }

  void createNoteDate(String email, String id, String date) {
    _database.put('$email-$id-date', date);
  }

  void updateIds(String key, List<dynamic> values) {
    _database.put(key, values);
  }
  
  List<dynamic> retrieveIds(String email) {
    return _database.get(email) ?? <dynamic>[];
  }

  String retrieveTitle(String email, String id) {
    return _database.get('$email-$id-title');
  }

  String retrieveBody(String email, String id) {
    return _database.get('$email-$id-body');
  }

  String retrieveDate(String email, String id) {
    return _database.get('$email-$id-date');
  }

  void updateTitle(String email, String id, String title) {
    _database.put('$email-$id-title', title);
  }

  void updateBody(String email, String id, String body) {
    _database.put('$email-$id-body', body);
  }

  void flushData(String email) {
    _database.toMap().forEach((key, value) {
      if (key.contains(email)) {
        _database.delete(key);
      }
    });
    print(_database.toMap());
  }
}


class LocalNoteDatabase {
  final _database = Hive.box('cloudNotesLocalDatabase');

  void createNoteEmail(String email, String id) {
    _database.put('$email-$id-email', email);
  }

  void createNoteId(String email, String id) {
    _database.put('$email-$id-id', id);
  }

  void createNoteTitle(String email, String id, String title) {
    _database.put('$email-$id-title', title);
  }

  void createNoteBody(String email, String id, String body) {
    _database.put('$email-$id-body', body);
  }

  void createNoteDate(String email, String id, String date) {
    _database.put('$email-$id-date', date);
  }

  void updateIds(String key, List<dynamic> values) {
    _database.put(key, values);
  }

  List<dynamic> retrieveIds(String email) {
    return _database.get(email) ?? <dynamic>[];
  }

  String retrieveTitle(String email, String id) {
    return _database.get('$email-$id-title');
  }

  String retrieveBody(String email, String id) {
    return _database.get('$email-$id-body');
  }

  String retrieveDate(String email, String id) {
    return _database.get('$email-$id-date');
  }

  void updateTitle(String email, String id, String title) {
    _database.put('$email-$id-title', title);
  }

  void updateBody(String email, String id, String body) {
    _database.put('$email-$id-body', body);
  }

  void delete(String email, String id) {
    _database.delete('$email-$id-title');
    _database.delete('$email-$id-body');
    _database.delete('$email-$id-date');
    _database.delete('$email-$id-email');
    _database.delete('$email-$id-id');
    List<dynamic> ids = retrieveIds(email);
    ids.remove(id);
    updateIds(email, ids);
  }

  void flushData(String email) {
    _database.toMap().forEach((key, value) {
      if (key.contains(email)) {
        _database.delete(key);
      }
    });
    print(_database.toMap());
  }
}
