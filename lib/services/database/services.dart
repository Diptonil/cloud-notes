import 'package:cloudnotes/services/database/providers.dart';
import 'package:uuid/uuid.dart';


List<String> getNotesService(String email) {
  NoteDatabase database = NoteDatabase();
  List<String> list = database.retrieveIds(email);
  return list;
}


void createNoteService(String email, String title, String body) {
  String id = const Uuid().v4().toString();
  NoteDatabase database = NoteDatabase();
  database.create('$email-$id-email', email);
  database.create('$email-$id-id', id);
  database.create('$email-$id-title', title);
  database.create('$email-$id-body', body);
  database.create('$email-$id-date', DateTime.now().toString());
  List<String> ids = database.retrieveIds(email);
  ids.add(id);
  database.updateIds(email, ids);
}
