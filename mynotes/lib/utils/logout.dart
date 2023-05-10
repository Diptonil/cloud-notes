import 'package:mynotes/services/auth/services.dart';


void logout(bool hasLoggedOut) async {
  if (hasLoggedOut) {
    await AuthService.firebase().logout();
  }
}
