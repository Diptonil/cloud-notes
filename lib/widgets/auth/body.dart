import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloudnotes/services/auth/services.dart';
import 'package:cloudnotes/widgets/auth/buttons.dart';
import 'package:cloudnotes/widgets/auth/textfields.dart';
import 'package:cloudnotes/utils/email_verification.dart';


class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}


class _RegisterBodyState extends State<RegisterBody> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailTextField(emailController: _email),
        PasswordTextField(passwordController: _password),
        ConfirmPasswordTextField(confirmPasswordController: _confirmPassword),
        RegisterButton(emailController: _email, passwordController: _password, confirmPasswordController: _confirmPassword),
        const LoginNowButton()
      ],
    );
  }
}


class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}


class _LoginBodyState extends State<LoginBody> {
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
        LoginButton(emailController: _email, passwordController: _password),
        const RegisterNowButton(),
      ]
    );
  }
}


class EmailConfirmationBody extends StatefulWidget {
  const EmailConfirmationBody({super.key});

  @override
  State<EmailConfirmationBody> createState() => _EmailConfirmationBodyState();
}


class _EmailConfirmationBodyState extends State<EmailConfirmationBody> {
  bool isVerified = false;
  Timer? timer;

  void checkVerification(Timer? timer, BuildContext context, bool isVerified) async {
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) {
      if (context.mounted) {
        displayVerificationSuccess(context);
      }
      timer?.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    AuthService.firebase().verifyEmail();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) { checkVerification(timer, context, isVerified); });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text('Hold tight! Just a few more steps...')),
        Center(child: Text('Check your email to verify yourself.')),
        Center(child: CircularProgressIndicator()),
        Center(child: ResendEMailButton())
      ],
    );
  }
}