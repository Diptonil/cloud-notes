import 'package:flutter/material.dart';

// Routes
const String homeRoute = '/home';
const String createNoteRoute = '/note/create';
const String loginRoute = '/login';
const String registerRoute = '/register';
const String verifyEmail = '/verify-email';


// Colours
const Color primaryTextColor = Colors.amber;
const Color secondaryTextColor = Colors.black;
const Color writingHintTextColor = Colors.grey;
const Color writingTextColor = Colors.white70;


// Database
const String databaseName = 'notes.db';
const String userTable = 'user';
const String notesTable = 'note';
const String idColumn = 'id';
const String userIdColumn = 'userId';
const String emailColumn = 'email';
const String textColumn = 'text';
const String headingColumn = 'heading';
const String dateColumn = 'date';
const String isSyncedWithCloudColumn = 'isSyncedWithCloud';


// Queries
const createUserTableQuery = '''
CREATE TABLE IF NOT EXISTS user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL UNIQUE
);
''';
const createNotesTableQuery = '''
CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  text TEXT,
  heading TEXT,
  is_synced_with_cloud INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY(user_id) REFERENCES user(id)
);
''';