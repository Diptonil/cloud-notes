import 'package:flutter/material.dart';
import 'package:mynotes/utils/firebase.dart';
import 'package:mynotes/widgets/screens.dart';


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
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
    )
  );
}
