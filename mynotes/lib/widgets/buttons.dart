import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/utils/firebase.dart';


class RegisterButton extends StatefulWidget {
  const RegisterButton({Key? key, required this.email, required this.password}) : super(key: key);
  final String email;
  final String password;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}


class _RegisterButtonState extends State<RegisterButton> {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        firebaseInitialize();
        UserCredential credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: widget.email, password: widget.password);
        print(credentials);
      },
      child: const Text("Register")
    );
  }
}