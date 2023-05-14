import 'package:flutter/material.dart';
import 'package:cloudnotes/services/auth/services.dart';
import 'package:cloudnotes/widgets/screens.dart';


void displayVerificationSuccess(BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: const Text('Email has been verified.'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const LoginScreen()));
    });
  }
}


void sendEmailVerification() {
  try {
    AuthService.firebase().verifyEmail();
  } catch (e) {
    debugPrint('$e');
  }
}