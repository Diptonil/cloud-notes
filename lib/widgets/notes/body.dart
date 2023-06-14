import 'package:cloudnotes/utils/constants.dart';
import 'package:cloudnotes/widgets/notes/buttons.dart';
import 'package:cloudnotes/widgets/notes/cards.dart';
import 'package:cloudnotes/widgets/notes/textfields.dart';
import 'package:flutter/material.dart';


class HomeBody extends StatefulWidget {
  const HomeBody({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}


class _HomeBodyState extends State<HomeBody> {
  late var notes = [];

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty?
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
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // ON CARD CLICK LOGIC HERE!
          },
          child: NoteCard(
            title: notes[index].title,
            body: notes[index].body,
            date: notes[index].createdTime
          ),
        ); 
      },
    );
  }
}


class CreateNoteBody extends StatefulWidget {
  const CreateNoteBody({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<CreateNoteBody> createState() => _CreateNoteBodyState();
}


class _CreateNoteBodyState extends State<CreateNoteBody> {
  late final TextEditingController _title;
  late final TextEditingController _body;

  @override
  void initState() {
    _title = TextEditingController();
    _body = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        NoteTitleTextField(titleController: _title),
        NoteBodyTextField(bodyController: _body),
        const SizedBox(
          height: 400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SaveNoteFloatingActionButton(titleController: _title, bodyController: _body, email: widget.email)
        )
      ]
    );
  }
}