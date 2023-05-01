import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
        if (password == confirmPassword) {
          UserCredential credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
          print(credentials);
        } else {
          print("No password match.");
        }
      },
      child: const Text("Register")
    );
  }
}