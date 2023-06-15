import 'package:cloudnotes/services/database/services.dart';
import 'package:cloudnotes/utils/constants.dart';
import 'package:cloudnotes/widgets/notes/buttons.dart';
import 'package:cloudnotes/widgets/notes/cards.dart';
import 'package:cloudnotes/widgets/notes/screens.dart';
import 'package:cloudnotes/widgets/notes/textfields.dart';
import 'package:flutter/material.dart';


class HomeBody extends StatefulWidget {
  const HomeBody({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}


class _HomeBodyState extends State<HomeBody> {
  late List<dynamic> notes = getNotesService(widget.email);

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty?
    const Center(
      child: Text(
        'No notes yet! Go create one.',
        style: TextStyle(
          fontSize: 16,
          color: primaryTextColor,
          fontFamily: 'Feather'
        ),
      ),
    ) :
    ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewNoteScreen(email: widget.email, title: notes[index]['title'], body: notes[index]['body'], id: notes[index]['id']),
              ),
            );
          },
          child: NoteCard(
            title: notes[index]['title'],
            body: notes[index]['body'],
            date: notes[index]['date']
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


class ViewNoteBody extends StatefulWidget {
  const ViewNoteBody({Key? key, required this.email, required this.title, required this.body, required this.id}) : super(key: key);
  final String email;
  final String title;
  final String body;
  final String id;

  @override
  State<ViewNoteBody> createState() => _ViewNoteBodyState();
}


class _ViewNoteBodyState extends State<ViewNoteBody> {
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
        NoteTitleEditTextField(titleController: _title, title: widget.title),
        NoteBodyEditTextField(bodyController: _body, body: widget.body),
        const SizedBox(
          height: 400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DeleteNoteFloatingActionButton(email: widget.email, id: widget.id),
              EditNoteFloatingActionButton(titleController: _title, bodyController: _body, email: widget.email, id: widget.id)
            ],
          )
        )
      ]
    );
  }
}


class ViewCloudNoteBody extends StatefulWidget {
  const ViewCloudNoteBody({Key? key, required this.email, required this.title, required this.body, required this.id}) : super(key: key);
  final String email;
  final String title;
  final String body;
  final String id;

  @override
  State<ViewCloudNoteBody> createState() => _ViewCloudNoteBodyState();
}


class _ViewCloudNoteBodyState extends State<ViewCloudNoteBody> {
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
        CloudNoteTitleEditTextField(titleController: _title, title: widget.title),
        CloudNoteBodyEditTextField(bodyController: _body, body: widget.body),
      ]
    );
  }
}


class CloudHomeBody extends StatefulWidget {
  const CloudHomeBody({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<CloudHomeBody> createState() => _CloudHomeBodyState();
}


class _CloudHomeBodyState extends State<CloudHomeBody> {
  late List<dynamic> notes = getCloudNotesService(widget.email);

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty?
    const Center(
      child: Text(
        'No notes yet! Go create one.',
        style: TextStyle(
          fontSize: 16,
          color: primaryTextColor,
          fontFamily: 'Feather'
        ),
      ),
    ) :
    ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewCloudNoteScreen(email: widget.email, title: notes[index]['title'], body: notes[index]['body'], id: notes[index]['id']),
              ),
            );
          },
          child: NoteCard(
            title: notes[index]['title'],
            body: notes[index]['body'],
            date: notes[index]['date']
          ),
        ); 
      },
    );
  }
}
