import 'package:flutter/material.dart';

/// Widget for number inputs.
class FirstTextInputBox extends StatefulWidget {
  const FirstTextInputBox({super.key});

  @override
  State<FirstTextInputBox> createState() => _FirstTextInputBoxState();
}


class _FirstTextInputBoxState extends State<FirstTextInputBox> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(color: Colors.amber),
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'First Number',
        fillColor: Color(0xFF263238),
      ),
    );
  }
}


class SecondTextInputBox extends StatefulWidget {
  const SecondTextInputBox({super.key});

  @override
  State<SecondTextInputBox> createState() => _SecondTextInputBoxState();
}


class _SecondTextInputBoxState extends State<SecondTextInputBox> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(color: Colors.amber),
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Second Number',
        fillColor: Color(0xFF263238),
  
      ),
    );
  }
}