import 'package:cloudnotes/services/database/models.dart';
import 'package:cloudnotes/utils/constants.dart';
import 'package:cloudnotes/widgets/notes/screens.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class CreateNoteFloatingActionButton extends StatefulWidget {
  final String email;
  const CreateNoteFloatingActionButton({Key? key, required this.email}) : super(key: key);

  @override
  State<CreateNoteFloatingActionButton> createState() => _CreateNoteFloatingActionButtonState();
}


class _CreateNoteFloatingActionButtonState extends State<CreateNoteFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateNoteScreen(email: widget.email),
        ),
      );      
      },
      backgroundColor: primaryTextColor,
      foregroundColor: secondaryTextColor,
      child: const Icon(Icons.add),
    );
  }
}


class SaveNoteFloatingActionButton extends StatefulWidget {
  const SaveNoteFloatingActionButton({Key? key, required this.titleController, required this.bodyController, required this.email}) : super(key: key);
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final String email;

  @override
  State<SaveNoteFloatingActionButton> createState() => _SaveNoteFloatingActionButtonState();
}


class _SaveNoteFloatingActionButtonState extends State<SaveNoteFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final String title = widget.titleController.text;
        final String body = widget.bodyController.text;
        Note note = Note(body: body, createdTime: DateTime.now(), isSynced: false, title: title, email: widget.email);
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(email: widget.email),
            ),
          );
        }
      },
      backgroundColor: primaryTextColor,
      foregroundColor: secondaryTextColor,
      child: const Icon(Icons.done),
    );
  }
}
