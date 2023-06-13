import 'package:flutter/material.dart';
import 'package:cloudnotes/services/auth/exceptions.dart';
import 'package:cloudnotes/services/auth/services.dart';
import 'package:cloudnotes/widgets/auth/dialogs.dart';


void authPasswordMismatch(BuildContext context) {
  const String error = 'Passwords do not match. Please try again.';
  showErrorDialog(context, error);
}


void authSuccesful(BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: const Text('Registration Succesful. Please verify email.'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


void authRegistration(BuildContext context, String email, String password, String confirmPassword) async {
  if (password == confirmPassword) {
    try {
      await AuthService.firebase().register(email: email, password: password);
      if (context.mounted) {
        authSuccesful(context);
      }
    } on WeakPasswordAuthException {
      showErrorDialog(context, 'The password is too weak. Please try again.');
    } on EmailAlreadyInUseAuthException {
      showErrorDialog(context, 'The account already exists for that email. Please try logging in.');      
    } on InvalidEmailAuthException {
      showErrorDialog(context, 'Incorrect values for email entered.');
    } on GenericAuthException {
      showErrorDialog(context, 'Some problem has occured. Please try again later.');
    }
  } else {
    authPasswordMismatch(context);
  }
}