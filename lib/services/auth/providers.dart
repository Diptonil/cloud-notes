import 'package:cloudnotes/services/auth/exceptions.dart';
import 'package:cloudnotes/services/auth/users.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, FirebaseAuthException;


abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<AuthUser?> login({required String email, required String password});

  Future<AuthUser?> register({required String email, required String password});

  Future<void> verifyEmail();

  Future<void> logout();
}


class FirebaseAuthProvider implements AuthProvider {
  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    return (user != null)? AuthUser.fromFirebase(user) : null;
  }

  @override
  Future<AuthUser?> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch(exception) {
      if (exception.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (exception.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch(exception) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logout() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<AuthUser?> register({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch(exception) {
      if (exception.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (exception.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException();
      } else if (exception.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch(exception) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> verifyEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }
}