import 'package:cloudnotes/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void firebaseInitialize() async {
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
}
