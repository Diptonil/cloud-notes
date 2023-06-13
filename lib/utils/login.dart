import 'package:flutter/material.dart';
import 'package:cloudnotes/services/auth/exceptions.dart';
import 'package:cloudnotes/services/auth/services.dart';
import 'package:cloudnotes/widgets/auth/dialogs.dart';
import 'package:cloudnotes/utils/constants.dart';


void authLogin(BuildContext context, String email, String password) async {
  try {
    await AuthService.firebase().login(email: email, password: password);
    final user = AuthService.firebase().currentUser;
    if (user?.isEmailVerified ?? false) {
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (route) => false, arguments: email);
      }
    } else {
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(verifyEmail, (route) => false);
      }
    }
  } on UserNotFoundAuthException {
    showErrorDialog(context, 'No user found for that email.');
  } on WrongPasswordAuthException {
    showErrorDialog(context, 'Wrong password provided for that user.');
  } on GenericAuthException {
    showErrorDialog(context, 'Some problem has occured. Please try again later.');    
  }
}