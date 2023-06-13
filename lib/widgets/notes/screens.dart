import 'package:cloudnotes/widgets/appbar.dart';
import 'package:cloudnotes/widgets/notes/body.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: Center(child: HomeBody()),
    );
  }
}