import 'package:firebase_auth/firebase_auth.dart' show User;


class AuthUser {
  final bool isEmailVerified;

  const AuthUser({required this.isEmailVerified});

  factory AuthUser.fromFirebase(User user) {
    return AuthUser(isEmailVerified: user.emailVerified);
  }
}