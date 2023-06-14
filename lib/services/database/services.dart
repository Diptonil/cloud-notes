import 'package:hive_flutter/hive_flutter.dart';


class Database {
  final _database = Hive.box('cloudNotesUserDatabase');

  void write(String key, Object value) {
    _database.put(key, value);
  }

  Object read(String key) {
    return _database.get(key);
  }

  void delete(String key) {
    _database.delete(key);
  }
}


class NoteDatabase {
  final _database = Hive.box('cloudNotesNotesDatabase');

  void create(Object note) {
    _database.add(note);
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