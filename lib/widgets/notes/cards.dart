import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final DateTime date;

  const NoteCard({Key? key, required this.title, required this.content, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _truncateContent(),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              _formatDate(),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateContent() {
    const int maxLength = 100;
    if (content.length <= maxLength) {
      return content;
    } else {
      var result = content.substring(0, maxLength);
      return '$result ...';
    }
  }

  String _formatDate() {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(date);
  }
}
