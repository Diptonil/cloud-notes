import 'package:flutter/material.dart';
import 'package:mynotes/widgets/body.dart';
import 'package:mynotes/widgets/appbar.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    )
  );
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: Center(child: RegisterBody()),
    );
  }
}