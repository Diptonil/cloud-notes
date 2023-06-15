import 'package:cloudnotes/services/database/services.dart';
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
        createNoteService(widget.email, title, body);
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


class EditNoteFloatingActionButton extends StatefulWidget {
  const EditNoteFloatingActionButton({Key? key, required this.titleController, required this.bodyController, required this.email, required this.id}) : super(key: key);
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final String email;
  final String id;

  @override
  State<EditNoteFloatingActionButton> createState() => _EditNoteFloatingActionButtonState();
}


class _EditNoteFloatingActionButtonState extends State<EditNoteFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'editButton',
      onPressed: () async {
        final String title = widget.titleController.text;
        final String body = widget.bodyController.text;
        editNoteService(widget.email, widget.id, title, body);
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


class DeleteNoteFloatingActionButton extends StatefulWidget {
  const DeleteNoteFloatingActionButton({Key? key, required this.email, required this.id}) : super(key: key);
  final String email;
  final String id;

  @override
  State<DeleteNoteFloatingActionButton> createState() => _DeleteNoteFloatingActionButtonState();
}


class _DeleteNoteFloatingActionButtonState extends State<DeleteNoteFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'deleteButton',
      onPressed: () async {
        deleteNoteService(widget.email, widget.id);
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
      child: const Icon(Icons.delete),
    );
  }
}


class CancelButton extends StatefulWidget {
  const CancelButton({super.key});

  @override
  State<CancelButton> createState() => _CancelButtonState();
}


class _CancelButtonState extends State<CancelButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(false);
      },
      child: const Text('Cancel'),
    );
  }
}


class OKButton extends StatefulWidget {
  const OKButton({super.key});

  @override
  State<OKButton> createState() => _OKButtonState();
}


class _OKButtonState extends State<OKButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: const Text('OK'),
    );
  }
}
