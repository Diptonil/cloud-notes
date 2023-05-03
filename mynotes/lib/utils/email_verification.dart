import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/widgets/screens.dart';


void displayVerificationSuccess(BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: const Text("Email has been verified."),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const HomeScreen()));
      },
    ),
  );
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const HomeScreen()));
    });
  }
}


void sendEmailVerification() {
  try {
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
  } catch (e) {
    debugPrint('$e');
  }
}