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
    return const AlertDialog(
      title: Text('Log Out'),
      content: Text('Are you sure that you wish to log out?'),
      actions: [
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
      title: const Text('Error'),
      content: Text(error),
      actions: const [
        OKButton(),
      ],
    );
  }
}
