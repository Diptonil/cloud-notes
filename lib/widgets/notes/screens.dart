import 'package:cloudnotes/widgets/appbar.dart';
import 'package:cloudnotes/widgets/notes/body.dart';
import 'package:cloudnotes/widgets/notes/buttons.dart';
import 'package:flutter/material.dart';
import 'package:cloudnotes/utils/constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: const BaseAppBar(),
      body: Center(child: HomeBody(email: email)),
      floatingActionButton: CreateNoteFloatingActionButton(email: email),
    );
  }
}


class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: const BaseAppBar(),
      body: Center(child: CreateNoteBody(email: email))
    );
  }
}


class ViewNoteScreen extends StatelessWidget {
  const ViewNoteScreen({super.key, required this.email, required this.title, required this.body, required this.id});
  final String email;
  final String title;
  final String body;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: const BaseAppBar(),
      body: Center(child: ViewNoteBody(email: email, title: title, body: body, id: id))
    );
  }
}