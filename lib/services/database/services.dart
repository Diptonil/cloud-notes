import 'package:cloudnotes/services/database/providers.dart';
import 'package:uuid/uuid.dart';


List<dynamic> getNotesService(String email) {
  NoteDatabase database = NoteDatabase();
  List<dynamic> ids = database.retrieveIds(email);
  List<dynamic> mapList = <dynamic>[];
  for (String id in ids) {
    Map<String, String> map = {
      'id': id,
      'title': database.retrieveTitle(email, id),
      'body': database.retrieveBody(email, id),
      'date': database.retrieveDate(email, id),
    };
    mapList.add(map);
  }
  return mapList;
}


List<dynamic> getCloudNotesService(String email) {
  CloudNoteDatabase database = CloudNoteDatabase();
  List<dynamic> ids = database.retrieveIds(email);
  List<dynamic> mapList = <dynamic>[];
  for (String id in ids) {
    Map<String, String> map = {
      'id': id,
      'title': database.retrieveTitle(email, id),
      'body': database.retrieveBody(email, id),
      'date': database.retrieveDate(email, id),
    };
    mapList.add(map);
  }
  return mapList;
}


void createNoteService(String email, String title, String body) {
  String id = const Uuid().v4().toString();
  NoteDatabase database = NoteDatabase();
  database.createNoteEmail(email, id);
  database.createNoteId(email, id);
  database.createNoteTitle(email, id, title);
  database.createNoteBody(email, id, body);
  database.createNoteDate(email, id, DateTime.now().toString());
  List<dynamic> ids = database.retrieveIds(email);
  ids.add(id);
  database.deleteLocalIds(email, ids);
}


void editNoteService(String email, String id, String title, String body) {
  NoteDatabase database = NoteDatabase();
  database.updateBody(email, id, body);
  database.updateTitle(email, id, title);
}


void deleteNoteService(String email, String id) {
  NoteDatabase database = NoteDatabase();
  database.delete(email, id);
}


void syncNotesService(String email) {
  NoteDatabase database = NoteDatabase();
  database.sync(email);
}


void flushCloudNotesService(String email) {
  CloudNoteDatabase database = CloudNoteDatabase();
  database.flushData(email);
}


void flushLocalNotesService(String email) {
  NoteDatabase database = NoteDatabase();
  database.flushData(email);
}