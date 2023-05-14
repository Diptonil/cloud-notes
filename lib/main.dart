import 'package:flutter/material.dart';
import 'package:cloudnotes/utils/firebase.dart';
import 'package:cloudnotes/widgets/screens.dart';
import 'package:cloudnotes/utils/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseInitialize();
  runApp(
    MaterialApp(
      title: 'Cloud Notes',
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
