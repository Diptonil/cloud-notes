import 'package:cloudnotes/utils/constants.dart';
import 'package:cloudnotes/widgets/appbar.dart';
import 'package:cloudnotes/widgets/notes/body.dart';
import 'package:cloudnotes/widgets/notes/buttons.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? email = ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: const BaseAppBar(),
      body: Center(child: HomeBody(email: email)),
      floatingActionButton: const CreateNoteFloatingActionButton(),
    );
  }
}


class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: secondaryTextColor,
      appBar: BaseAppBar(),
      body: Center(child: CreateNoteBody()),
    );
  }
}