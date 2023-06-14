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
  await Hive.openBox('cloudNotesLocalDatabase');
  await Hive.openBox('cloudNotesPermanentDatabase');

  runApp(
      MaterialApp(
        title: 'Cloud Notes',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const LoginScreen(),
        routes: {
          homeRoute: (context) => const HomeScreen(email: ''),
          createNoteRoute: (context) => const CreateNoteScreen(email: ''),
          loginRoute: (context) => const LoginScreen(),
          registerRoute: (context) => const RegisterScreen(),
          verifyEmail: (context) => const EmailVerificationScreen()
        },
        debugShowCheckedModeBanner: false,
    )
  );
}
