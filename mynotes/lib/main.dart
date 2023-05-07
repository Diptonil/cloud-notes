import 'package:flutter/material.dart';
import 'package:mynotes/utils/firebase.dart';
import 'package:mynotes/widgets/screens.dart';
import 'package:mynotes/utils/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseInitialize();
  runApp(
    MaterialApp(
      title: 'My Notes',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const LoginScreen(),
      routes: {
        homeRoute: (context) => const HomeScreen(),
        loginRoute: (context) => const LoginScreen(),
        registerRoute: (context) => const RegisterScreen(),
        verifyEmail: (context) => const EmailVerificationScreen()
      },
      debugShowCheckedModeBanner: false,
    )
  );
}
