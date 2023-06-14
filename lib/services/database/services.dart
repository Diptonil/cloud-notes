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


void createNoteService(String email, String title, String body) {
  String id = const Uuid().v4().toString();
  NoteDatabase database = NoteDatabase();
  database.create('$email-$id-email', email);
  database.create('$email-$id-id', id);
  database.create('$email-$id-title', title);
  database.create('$email-$id-body', body);
  database.create('$email-$id-date', DateTime.now().toString());
  List<dynamic> ids = database.retrieveIds(email);
  ids.add(id);
  database.updateIds(email, ids);
}
