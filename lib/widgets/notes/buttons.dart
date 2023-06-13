import 'package:cloudnotes/utils/constants.dart';
import 'package:flutter/material.dart';


class CreateNoteFloatingActionButton extends StatefulWidget {
  const CreateNoteFloatingActionButton({super.key});

  @override
  State<CreateNoteFloatingActionButton> createState() => _CreateNoteFloatingActionButtonState();
}


class _CreateNoteFloatingActionButtonState extends State<CreateNoteFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(createNoteRoute, (route) => false);
      },
      backgroundColor: primaryTextColor,
      child: const Icon(Icons.add),
    );
  }
}