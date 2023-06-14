import 'package:hive_flutter/hive_flutter.dart';


class NoteDatabase {
  final _database = Hive.box('cloudNotesNotesDatabase');

  void create(String key, String value) {
    _database.put(key, value);
  }

  void updateIds(String key, List<String> values) {
    _database.put(key, values);
  }

  List<String> retrieveIds(String email) {
    return _database.get(email) ?? <String>[];
  }

  Object readAll(int noteUserId) {
    return _database.get(noteUserId);
  }

  void deleteAll(int noteUserId) {
    _database.delete(noteUserId);
  }

  Object read(int noteId) {
    return _database.get(noteId);
  }

  void delete(int noteId) {
    _database.delete(noteId);
  }
}
