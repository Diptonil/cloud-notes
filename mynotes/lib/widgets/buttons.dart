import 'package:flutter/material.dart';
import 'package:mynotes/widgets/screens.dart';
import 'package:mynotes/utils/registration.dart';
import 'package:mynotes/utils/login.dart';
import 'package:mynotes/utils/email_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => const EmailVerificationScreen()));
        print("works");
        if (FirebaseAuth.instance.currentUser != null) {
          
        }
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


class ResendEMailButton extends StatefulWidget {
  const ResendEMailButton({super.key});

  @override
  State<ResendEMailButton> createState() => _ResendEMailButtonState();
}

class _ResendEMailButtonState extends State<ResendEMailButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Resend'),
      onPressed: () { sendEmailVerification(); }
    );
  }
}