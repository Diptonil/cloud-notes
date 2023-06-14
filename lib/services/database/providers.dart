import 'package:hive_flutter/hive_flutter.dart';


class NoteDatabase {
  final _databaseLocal = Hive.box('cloudNotesLocalDatabase');
  final _databasePermanent = Hive.box('cloudNotesPermanentDatabase');

  void create(String key, String value) {
    _databaseLocal.put(key, value);
    _databasePermanent.put(key, value);
  }

  void createNoteEmail(String email, String id) {
    _databaseLocal.put('$email-$id-email', email);
    _databasePermanent.put('$email-$id-email', email);
  }

  void createNoteId(String email, String id) {
    _databaseLocal.put('$email-$id-id', id);
    _databasePermanent.put('$email-$id-id', id);
  }

  void createNoteTitle(String email, String id, String title) {
    _databaseLocal.put('$email-$id-title', title);
    _databasePermanent.put('$email-$id-title', title);
  }

  void createNoteBody(String email, String id, String body) {
    _databaseLocal.put('$email-$id-body', body);
    _databasePermanent.put('$email-$id-body', body);
  }

  void createNoteDate(String email, String id, String date) {
    _databaseLocal.put('$email-$id-date', date);
    _databasePermanent.put('$email-$id-date', date);
  }

  void updateIds(String key, List<dynamic> values) {
    _databaseLocal.put(key, values);
    _databasePermanent.put(key, values);
  }

  void deleteLocalIds(String key, List<dynamic> values) {
    _databaseLocal.put(key, values);
  }

  List<dynamic> retrieveIds(String email) {
    return _databaseLocal.get(email) ?? <dynamic>[];
  }

  String retrieveTitle(String email, String id) {
    return _databaseLocal.get('$email-$id-title');
  }

  String retrieveBody(String email, String id) {
    return _databaseLocal.get('$email-$id-body');
  }

  String retrieveDate(String email, String id) {
    return _databaseLocal.get('$email-$id-date');
  }

  void updateTitle(String email, String id, String title) {
    _databaseLocal.put('$email-$id-title', title);
    _databasePermanent.put('$email-$id-title', title);
  }

  void updateBody(String email, String id, String body) {
    _databaseLocal.put('$email-$id-body', body);
    _databasePermanent.put('$email-$id-body', body);
  }

  void delete(String email, String id) {
    _databaseLocal.delete('$email-$id-title');
    _databaseLocal.delete('$email-$id-body');
    _databaseLocal.delete('$email-$id-date');
    _databaseLocal.delete('$email-$id-email');
    _databaseLocal.delete('$email-$id-id');
    List<dynamic> ids = retrieveIds(email);
    ids.remove(id);
    updateIds(email, ids);
  }

  void sync(String email) {
    _databasePermanent.toMap().forEach((key, value) {
      print(key);
      if (key.contains(email)) {
        print('works');
        _databaseLocal.put(key, value);
      }
    });
    print(_databasePermanent.toMap());
    print(_databaseLocal.toMap());
  }

  void flushCloudData(String email) {
    _databasePermanent.toMap().forEach((key, value) {
      if (key.contains(email)) {
        _databasePermanent.delete(key);
      }
    });
    print(_databasePermanent.toMap());
  }

  void flushLocalData(String email) {
    _databaseLocal.toMap().forEach((key, value) {
      if (key.contains(email)) {
        _databaseLocal.delete(key);
      }
    });
    print(_databaseLocal.toMap());
  }
}
