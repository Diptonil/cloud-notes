import 'package:cloudnotes/widgets/appbar.dart';
import 'package:cloudnotes/widgets/notes/body.dart';
import 'package:cloudnotes/widgets/notes/buttons.dart';
import 'package:cloudnotes/widgets/notes/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:cloudnotes/utils/constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: BaseAppBar(email: email),
      floatingActionButton: CreateNoteFloatingActionButton(email: email),
      drawer: BaseNavigationDrawer(email: email),
      body: Center(child: HomeBody(email: email)),
    );
  }
}


class CloudHomeScreen extends StatelessWidget {
  const CloudHomeScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: BaseAppBar(email: email),
      drawer: BaseNavigationDrawer(email: email),
      body: Center(child: CloudHomeBody(email: email)),
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
      appBar: BaseAppBar(email: email),
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
      appBar: BaseAppBar(email: email),
      body: Center(child: ViewNoteBody(email: email, title: title, body: body, id: id))
    );
  }
}


class ViewCloudNoteScreen extends StatelessWidget {
  const ViewCloudNoteScreen({super.key, required this.email, required this.title, required this.body, required this.id});
  final String email;
  final String title;
  final String body;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: BaseAppBar(email: email),
      body: Center(child: ViewCloudNoteBody(email: email, title: title, body: body, id: id))
    );
  }
}
