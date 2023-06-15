import 'package:cloudnotes/services/database/providers.dart';
import 'package:uuid/uuid.dart';


List<dynamic> getNotesService(String email) {
  LocalNoteDatabase database = LocalNoteDatabase();
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
  LocalNoteDatabase localNoteDatabase = LocalNoteDatabase();
  CloudNoteDatabase cloudNoteDatabase = CloudNoteDatabase();
  createNoteServiceHelper(localNoteDatabase, id, email, body, title);
  createNoteServiceHelper(cloudNoteDatabase, id, email, body, title);
}


void createNoteServiceHelper(dynamic database, String id, String email, String body, String title) {
  database.createNoteEmail(email, id);
  database.createNoteId(email, id);
  database.createNoteTitle(email, id, title);
  database.createNoteBody(email, id, body);
  database.createNoteDate(email, id, DateTime.now().toString());
  List<dynamic> ids = database.retrieveIds(email);
  ids.add(id);
  database.updateIds(email, ids);
}


void editNoteService(String email, String id, String title, String body) {
  LocalNoteDatabase localNoteDatabase = LocalNoteDatabase();
  CloudNoteDatabase cloudNoteDatabase = CloudNoteDatabase();
  localNoteDatabase.updateBody(email, id, body);
  localNoteDatabase.updateTitle(email, id, title);
  cloudNoteDatabase.updateBody(email, id, body);
  cloudNoteDatabase.updateTitle(email, id, title);
}


void deleteNoteService(String email, String id) {
  LocalNoteDatabase database = LocalNoteDatabase();
  database.delete(email, id);
}


void flushCloudNotesService(String email) {
  CloudNoteDatabase database = CloudNoteDatabase();
  database.flushData(email);
}


void flushLocalNotesService(String email) {
  LocalNoteDatabase database = LocalNoteDatabase();
  database.flushData(email);
}