import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({super.key});

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {},
      child: const Text("Register")
    );
  }
}