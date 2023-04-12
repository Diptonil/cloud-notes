import 'package:flutter/material.dart';
import 'widgets/appbar.dart';
import 'widgets/body.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: BaseAppBar(),
        body: Center(
          child: BodyWidget(),
        ),
      ),
    );
  }
}
