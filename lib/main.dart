import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloudnotes/utils/firebase.dart';
import 'package:cloudnotes/widgets/auth/screens.dart';
import 'package:cloudnotes/widgets/notes/screens.dart';
import 'package:cloudnotes/utils/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseInitialize();
  await Hive.initFlutter();
  await Hive.openBox('cloudNotesUserDatabase');
  await Hive.openBox('cloudNotesNotesDatabase');

  runApp(
      MaterialApp(
        title: 'Cloud Notes',
        home: const LoginScreen(),
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.amber
          )
        ),
        routes: {
          homeRoute: (context) => const HomeScreen(),
          createNoteRoute: (context) => const CreateNoteScreen(),
          loginRoute: (context) => const LoginScreen(),
          registerRoute: (context) => const RegisterScreen(),
          verifyEmail: (context) => const EmailVerificationScreen()
        },
        debugShowCheckedModeBanner: false,
    )
  );
}
