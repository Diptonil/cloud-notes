import 'package:flutter/material.dart';
import 'package:mynotes/widgets/buttons.dart';
import 'package:mynotes/widgets/textfields.dart';


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
        EmailTextField(emailController: _email),
        PasswordTextField(passwordController: _password),
        RegisterButton(email: _email.text, password: _password.text),
      ],
    );
  }
}