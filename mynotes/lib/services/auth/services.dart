import 'package:mynotes/services/auth/providers.dart';
import 'package:mynotes/services/auth/users.dart';


class AuthService implements AuthProvider {
  final AuthProvider provider;

  const AuthService(this.provider);

  factory AuthService.firebase() {
    return AuthService(FirebaseAuthProvider());
  }

  @override
  AuthUser? get currentUser {
    return provider.currentUser;
  }

  @override
  Future<AuthUser?> login({required String email, required String password}) {
    return provider.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return provider.logout();
  }

  @override
  Future<AuthUser?> register({required String email, required String password}) {
    return provider.register(email: email, password: password);
  }

  @override
  Future<void> verifyEmail() {
    return provider.verifyEmail();
  }
}