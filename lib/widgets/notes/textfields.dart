import 'package:cloudnotes/utils/constants.dart';
import 'package:flutter/material.dart';


class NoteTitleTextField extends StatelessWidget {
  const NoteTitleTextField({Key? key, required this.titleController}) : super(key: key);
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        cursorColor: writingHintTextColor,
        style: const TextStyle(
          color: writingTextColor,
        ),
        controller: titleController,
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        autocorrect: true,
        decoration: const InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(
            color: writingHintTextColor,
            fontFamily: 'Feather'
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          )
        ),
      )
    );
  }
}


class NoteBodyTextField extends StatelessWidget {
  const NoteBodyTextField({Key? key, required this.bodyController}) : super(key: key);
  final TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        cursorColor: writingHintTextColor,
        style: const TextStyle(
          color: writingTextColor,
        ),
        controller: bodyController,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        enableSuggestions: true,
        autocorrect: true,
        decoration: const InputDecoration(
          hintText: 'Start writing...',
          hintStyle: TextStyle(
            color: writingHintTextColor,
            fontFamily: 'Feather'
          ),
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryTextColor, width: 0.0),
          )
        ),
      )
    );
  }
}


class NoteTitleEditTextField extends StatelessWidget {
  const NoteTitleEditTextField({Key? key, required this.titleController, required this.title}) : super(key: key);
  final TextEditingController titleController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        cursorColor: writingHintTextColor,
        style: const TextStyle(
          color: writingTextColor,
        ),
        controller: titleController..text = title,
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        autocorrect: true,
        decoration: const InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(
            color: writingHintTextColor,
            fontFamily: 'Feather'
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          )
        ),
      )
    );
  }
}


class NoteBodyEditTextField extends StatelessWidget {
  const NoteBodyEditTextField({Key? key, required this.bodyController, required this.body}) : super(key: key);
  final TextEditingController bodyController;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        cursorColor: writingHintTextColor,
        style: const TextStyle(
          color: writingTextColor,
        ),
        controller: bodyController..text = body,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        enableSuggestions: true,
        autocorrect: true,
        decoration: const InputDecoration(
          hintText: 'Start writing...',
          hintStyle: TextStyle(
            color: writingHintTextColor,
            fontFamily: 'Feather'
          ),
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryTextColor, width: 0.0),
          )
        ),
      )
    );
  }
}
