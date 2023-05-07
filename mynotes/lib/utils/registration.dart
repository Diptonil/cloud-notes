import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/widgets/dialogs.dart';


void authPasswordMismatch(BuildContext context) {
  const String error = 'Passwords do not match. Please try again.';
  showErrorDialog(context, error);
}


void authSuccesful(BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: const Text('Registration Succesful. Please wait.'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


void authUnknownException(BuildContext context) {
  const String error = 'Some problem has occured. Please try again later.';
  showErrorDialog(context, error);
}


void authExceptions(BuildContext context, FirebaseAuthException exception) {
  late String error;
  if (exception.code == 'weak-password') {
    error = 'The password is too weak. Please try again.';
  } else if (exception.code == 'email-already-in-use') {
    error = 'The account already exists for that email. Please try logging in.';
  } else if (exception.code == 'invalid-email') {
    error = 'Incorrect values for email entered.';
  } else {
    error = 'Some problem has occured. Please try again later.';
  }
  showErrorDialog(context, error);
}


void authRegistration(BuildContext context, String email, String password, String confirmPassword) async {
  if (password == confirmPassword) {
    try {
      UserCredential credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        authSuccesful(context);
      }
    } on FirebaseAuthException catch(exception) {
      authExceptions(context, exception);
    } catch(exception) {
      authUnknownException(context);
    }
  } else {
    authPasswordMismatch(context);
  }
}