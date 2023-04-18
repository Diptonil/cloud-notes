import 'package:flutter/material.dart';
import 'package:mynotes/widgets/buttons.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _email,
          decoration: const InputDecoration(
            hintText: 'Email'
          ),
        ),
        TextField(
          controller: _password,
          decoration: const InputDecoration(
            hintText: 'Password'
          ),
        ),
        const RegisterButton(),
      ],
    );
  }
}