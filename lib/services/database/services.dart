import 'package:cloudnotes/utils/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'package:cloudnotes/services/database/exceptions.dart';


class DatabaseService {
  Database? _db;

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      final documentPath = await getApplicationDocumentsDirectory();
      final databasePath = join(documentPath.path, databaseName);
      _db  = await openDatabase(databasePath);
      await _db?.execute(createUserTableQuery);
      await _db?.execute(createNotesTableQuery);
    } on MissingPlatformDirectoryException {
      throw DocumentsDirectoryNotFoundException();
    }
  }

  Future<void> close() async {
    if (_db == null) {
      throw DatabaseNotOpenException();
    }
    await _db?.close();
  }

  Database? _getDatabase() {
    if (_db == null) {
      throw DatabaseNotOpenException();
    }
    return _db;
  }
}