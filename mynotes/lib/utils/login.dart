import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


void authUnknownException(BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: const Text('Some problem has occured. Please try again later.'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


void authExceptions(BuildContext context, FirebaseAuthException exception) {
  late String error;
  if (exception.code == 'user-not-found') {
    error = 'No user found for that email.';
  } else if (exception.code == 'wrong-password') {
    error = 'Wrong password provided for that user.';
  } else {
    error = 'Some problem has occured. Please try again later.';
  }

  SnackBar snackBar = SnackBar(
    content: Text(error),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


void authLogin(BuildContext context, String email, String password) async {
  try {
    UserCredential credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch(exception) {
    authExceptions(context, exception);
  } catch(exception) {
    authUnknownException(context);
  }
}