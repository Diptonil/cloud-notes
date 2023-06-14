import 'package:flutter/material.dart';
import 'package:cloudnotes/utils/constants.dart';


class NoteCard extends StatelessWidget {
  final String title;
  final String body;
  final String date;

  const NoteCard({Key? key, required this.title, required this.body, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: secondaryTextColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: primaryTextColor, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
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
                color: primaryTextColor,
                fontFamily: 'Feather'
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _truncateContent(),
              style: const TextStyle(fontSize: 14, color: primaryTextColor),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(fontSize: 12, color: primaryTextColor),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateContent() {
    const int maxLength = 100;
    if (body.length <= maxLength) {
      return body;
    } else {
      var result = body.substring(0, maxLength);
      return '$result ...';
    }
  }
}
