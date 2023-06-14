const String tableNotes = 'notes';


class NoteFields {
  static final List<String> values = [id, isSynced, title, body, time];

  static const String id = '_id';
  static const String email = 'email';
  static const String isSynced = 'isSynced';
  static const String title = 'title';
  static const String body = 'body';
  static const String time = 'time';
}


class Note {
  final int? id;
  final String email;
  final bool isSynced;
  final String title;
  final String body;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.email,
    required this.isSynced,
    required this.title,
    required this.body,
    required this.createdTime,
  });

  Note copy({
    int? id,
    String? email,
    bool? isSynced,
    String? title,
    String? body,
    DateTime? createdTime,
  }) =>
    Note(
      id: id ?? this.id,
      email: email ?? this.email,
      isSynced: isSynced ?? this.isSynced,
      title: title ?? this.title,
      body: body ?? this.body,
      createdTime: createdTime ?? this.createdTime,
    );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    email: json[NoteFields.email] as String,
    isSynced: json[NoteFields.isSynced] == 1,
    title: json[NoteFields.title] as String,
    body: json[NoteFields.body] as String,
    createdTime: DateTime.parse(json[NoteFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.email: email,
    NoteFields.title: title,
    NoteFields.isSynced: isSynced ? 1 : 0,
    NoteFields.body: body,
    NoteFields.time: createdTime.toIso8601String(),
  };
}