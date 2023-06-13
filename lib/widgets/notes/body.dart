import 'package:cloudnotes/services/database/services.dart';
import 'package:cloudnotes/widgets/notes/cards.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';


class HomeBody extends StatefulWidget {
  final String? email;
  const HomeBody({Key? key, required this.email}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}


class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final note = getNotes(widget.email);
    return note.isEmpty?
    const Center(
      child: Text(
        'No notes yet! Go create one.',
        style: TextStyle(
          fontSize: 16,
          color: primaryTextColor
        ),
      ),
    ) :
    ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {
        return NoteCard(
          title: note[index]['title'],
          content: note[index]['content'],
          date: note[index]['date']
        );
      },
    );
  }
}


class CreateNoteBody extends StatefulWidget {
  const CreateNoteBody({super.key});

  @override
  State<CreateNoteBody> createState() => _CreateNoteBodyState();
}


class _CreateNoteBodyState extends State<CreateNoteBody> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}