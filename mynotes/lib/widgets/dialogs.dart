import 'package:flutter/material.dart';
import 'package:mynotes/widgets/buttons.dart';


Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return const SignOutAlertDialog();
    }
  ).then((value) => value ?? false);
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