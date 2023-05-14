class CloudNote {
  final String id;
  final String heading;
  final String text;
  final DateTime date;
  final bool isSyncedWithCloud;

  const CloudNote({required this.id, required this.heading, required this.text, required this.date, required this.isSyncedWithCloud});

  @override
  String toString() {
    return '$id: $heading on $date.';
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