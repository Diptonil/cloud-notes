import 'package:flutter/material.dart';


class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key, required this.emailController}) : super(key: key);
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      enableSuggestions: true,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: 'Email'
      )
    );
  }
}


class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key, required this.passwordController}) : super(key: key);
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: 'Password'
      )
    );
  }
}


class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({Key? key, required this.confirmPasswordController}) : super(key: key);
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: confirmPasswordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: 'Confirm Password'
      )
    );
  }
}