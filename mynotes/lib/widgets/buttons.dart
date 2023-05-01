import 'package:flutter/material.dart';
import 'package:mynotes/utils/registration.dart';
import 'package:mynotes/utils/login.dart';


class RegisterButton extends StatefulWidget {
  const RegisterButton({Key? key, required this.emailController, required this.passwordController, required this.confirmPasswordController}) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}


class _RegisterButtonState extends State<RegisterButton> {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final String email = widget.emailController.text;
        final String password = widget.passwordController.text;
        final String confirmPassword = widget.confirmPasswordController.text;
        authRegistration(context, email, password, confirmPassword);
      },
      child: const Text("Register")
    );
  }
}


class LoginButton extends StatefulWidget {
  const LoginButton({Key? key, required this.emailController, required this.passwordController}) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}


class _LoginButtonState extends State<LoginButton> {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final String email = widget.emailController.text;
        final String password = widget.passwordController.text;
        authLogin(context, email, password);
      },
      child: const Text("Login")
    );
  }
}