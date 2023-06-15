import 'package:flutter/material.dart';
import 'package:cloudnotes/widgets/auth/buttons.dart';


Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return const SignOutAlertDialog();
    }
  ).then((value) => value ?? false);
}


Future<void> showErrorDialog(BuildContext context, String error) {
  return showDialog(
    context: context,
    builder: (context) {
      return ErrorDialog(error: error);
    }
  );
}


class SignOutAlertDialog extends StatelessWidget {
  const SignOutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      title: const Text(
        'Log Out',
        style: TextStyle(fontFamily: 'Feather')
      ),
      content: const Text(
        'Are you sure that you wish to log out?',
        style: TextStyle(fontFamily: 'Feather')
      ),
      actions: const [
        CancelButton(),
        LogoutButton()
      ],
    );
  }
}


class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      title: const Text(
        'Error',
        style: TextStyle(fontFamily: 'Feather')
      ),
      content: Text(
        error,
        style: const TextStyle(fontFamily: 'Feather')
      ),
      actions: const [
        OKButton(),
      ],
    );
  }
}
