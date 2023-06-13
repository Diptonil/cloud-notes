import 'package:hive_flutter/hive_flutter.dart';


class NoteDatabase {
  final _database = Hive.box('cloudNotesNotesDatabase');

  void create(Object note) {
    _database.add(note);
  }

  List<Map<String, dynamic>> readAll(String? email) {
    final results = _database.get(email);
    return results ?? [];
  }

  void deleteAll(int userId) {
    _database.delete(userId);
  }

  Object read(int noteId) {
    return _database.get(noteId);
  }

  void delete(int noteId) {
    _database.delete(noteId);
  }
}
