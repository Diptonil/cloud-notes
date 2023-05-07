import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/widgets/dialogs.dart';


void authUnknownException(BuildContext context) {
  const String error = 'Some problem has occured. Please try again later.';
  showErrorDialog(context, error);
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
  showErrorDialog(context, error);
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