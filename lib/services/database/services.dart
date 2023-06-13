import 'package:cloudnotes/services/database/providers.dart';

List<Map<String, dynamic>> getNotes(String? email) {
  var database = NoteDatabase();
  return database.readAll(email);
}
