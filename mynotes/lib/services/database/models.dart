import 'package:flutter/foundation.dart';
import 'package:mynotes/utils/constants.dart';

@immutable
class User {
  final int id;
  final String email;

  const User({required this.id, required this.email});

  Map<String, dynamic> toMap() {
    return {
      idColumn: id,
      emailColumn: email
    };
  }

  @override
  String toString() {
    return 'User <$id: $email>';
  }

  @override bool operator == (covariant User other) {
    return id == other.id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}


@immutable
class CloudNote {
  final String id;
  final String heading;
  final String text;
  final DateTime date;
  final bool isSyncedWithCloud;

  const CloudNote({required this.id, required this.heading, required this.text, required this.date, required this.isSyncedWithCloud});

  Map<String, dynamic> toMap() {
    return {
      idColumn: id,
      headingColumn: heading,
      textColumn: text,
      dateColumn: date,
      isSyncedWithCloudColumn: isSyncedWithCloud
    };
  }

  @override
  String toString() {
    return 'Note <$id: $heading, $date, sync-$isSyncedWithCloud>';
  }

  @override
  bool operator == (covariant CloudNote other) {
    return id == other.id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}