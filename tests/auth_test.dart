import 'package:cloudnotes/services/auth/exceptions.dart';
import 'package:cloudnotes/services/auth/users.dart';
import 'package:test/test.dart';
import 'package:cloudnotes/services/auth/providers.dart';

void main() {
  group('Mock Authentication', () {
    final mockProvider = MockAuthProvider();

    test('Backend initialization.', () {
      expect(mockProvider.isInitialised, true);
    });

    test('Logout of a non-existent user.', () {
      expect(mockProvider.currentUser, null);
      expect(mockProvider.logout(),
          throwsA(const TypeMatcher<UserNotFoundAuthException>()));
    });

    test('Creation of user with an existing email.', () {
      expect(
          mockProvider.register(
              email: 'existing@email.com', password: 'password'),
          throwsA(const TypeMatcher<EmailAlreadyInUseAuthException>()));
    });

    test('Creation of user with a weak password.', () {
      expect(mockProvider.register(email: '', password: 'weak-password'),
          throwsA(const TypeMatcher<WeakPasswordAuthException>()));
    });

    test('Creation of user.', () async {
      final user = await mockProvider.register(
          email: 'test@email.com', password: 'password');
      expect(user, mockProvider.currentUser);
      expect(user?.isEmailVerified, false);
    });

    test('Login of unknown user.', () {
      expect(
          mockProvider.login(email: 'doesnt@exist.com', password: 'password'),
          throwsA(const TypeMatcher<UserNotFoundAuthException>()));
    });

    test('Login with wrong password.', () {
      expect(
          mockProvider.login(
              email: 'test@email.com', password: 'wrong-password'),
          throwsA(const TypeMatcher<WrongPasswordAuthException>()));
    });

    test('Correct login.', () async {
      final user = await mockProvider.login(
          email: 'test@email.com', password: 'password');
      expect(user?.isEmailVerified, true);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  final _isInitialized = true;

  bool get isInitialised {
    return _isInitialized;
  }

  @override
  AuthUser? get currentUser {
    return _user;
  }

  @override
  Future<AuthUser?> login(
      {required String email, required String password}) async {
    if (!isInitialised) {
      throw NotInitializedException();
    }
    if (email == 'doesnt@exist.com') {
      throw UserNotFoundAuthException();
    }
    if (password == 'wrong-password') {
      throw WrongPasswordAuthException();
    }
    _user = const AuthUser(isEmailVerified: true);
    return Future.value(_user);
  }

  @override
  Future<void> logout() async {
    if (!isInitialised) {
      throw NotInitializedException();
    }
    if (_user == null) {
      throw UserNotFoundAuthException();
    }
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<AuthUser?> register(
      {required String email, required String password}) async {
    if (!isInitialised) {
      throw NotInitializedException();
    }
    if (email == 'existing@email.com') {
      throw EmailAlreadyInUseAuthException();
    }
    if (password == 'weak-password') {
      throw WeakPasswordAuthException();
    }
    _user = const AuthUser(isEmailVerified: false);
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(_user);
  }

  @override
  Future<void> verifyEmail() async {
    if (!isInitialised) {
      throw NotInitializedException();
    }
    if (_user == null) {
      throw UserNotFoundAuthException();
    }
    _user = const AuthUser(isEmailVerified: true);
  }
}
