import 'package:firebase_auth/firebase_auth.dart';


void logout(bool hasLoggedOut) async {
  if (hasLoggedOut) {
    await FirebaseAuth.instance.signOut();
  }
}
