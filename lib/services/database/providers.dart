import 'package:hive_flutter/hive_flutter.dart';


class NoteDatabase {
  final _database = Hive.box('cloudNotesNotesDatabase');

  void create(String key, String value) {
    _database.put(key, value);
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
}
