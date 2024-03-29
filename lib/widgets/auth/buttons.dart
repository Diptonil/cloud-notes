import 'package:flutter/material.dart';
import 'package:cloudnotes/services/auth/services.dart';
import 'package:cloudnotes/utils/constants.dart';
import 'package:cloudnotes/widgets/auth/screens.dart';
import 'package:cloudnotes/utils/registration.dart';
import 'package:cloudnotes/utils/login.dart';
import 'package:cloudnotes/utils/email_verification.dart';


class RegisterButton extends StatefulWidget {
  const RegisterButton({Key? key, required this.emailController, required this.passwordController, required this.confirmPasswordController}) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}


class _RegisterButtonState extends State<RegisterButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final String email = widget.emailController.text;
        final String password = widget.passwordController.text;
        final String confirmPassword = widget.confirmPasswordController.text;
        authRegistration(context, email, password, confirmPassword);
        final user = AuthService.firebase().currentUser;
        print(user);
        if (user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => const EmailVerificationScreen()));
        }
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(secondaryTextColor),
        backgroundColor: MaterialStateProperty.all<Color>(primaryTextColor),
      ),
      child: const Text(
        'Register',
        style: TextStyle(fontFamily: 'Feather'),
      )
    );
  }
}


class LoginButton extends StatefulWidget {
  const LoginButton({Key? key, required this.emailController, required this.passwordController}) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}


class _LoginButtonState extends State<LoginButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final String email = widget.emailController.text;
        final String password = widget.passwordController.text;
        authLogin(context, email, password);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(secondaryTextColor),
        backgroundColor: MaterialStateProperty.all<Color>(primaryTextColor),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontFamily: 'Feather'),
      )
    );
  }
}


class ResendEMailButton extends StatefulWidget {
  const ResendEMailButton({super.key});

  @override
  State<ResendEMailButton> createState() => _ResendEMailButtonState();
}


class _ResendEMailButtonState extends State<ResendEMailButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Resend',
        style: TextStyle(fontFamily: 'Feather'),
      ),
      onPressed: () { sendEmailVerification(); }
    );
  }
}


class RegisterNowButton extends StatefulWidget {
  const RegisterNowButton({super.key});

  @override
  State<RegisterNowButton> createState() => _RegisterNowButtonState();
}


class _RegisterNowButtonState extends State<RegisterNowButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(primaryTextColor)
      ),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
      },
      child: const Text(
        'Not registered yet? Register here.',
        style: TextStyle(fontFamily: 'Feather'),
      )
    );
  }
}


class LoginNowButton extends StatefulWidget {
  const LoginNowButton({super.key});

  @override
  State<LoginNowButton> createState() => _LoginNowButtonState();
}


class _LoginNowButtonState extends State<LoginNowButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(primaryTextColor)
      ),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false);
      },
      child: const Text(
        'Already a member? Login here.',
        style: TextStyle(fontFamily: 'Feather'),
      )
    );
  }
}


class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}


class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: const Text(
        'Log Out',
        style: TextStyle(fontFamily: 'Feather'),
      ),
    );
  }
}


class OKButton extends StatefulWidget {
  const OKButton({super.key});

  @override
  State<OKButton> createState() => _OKButtonState();
}


class _OKButtonState extends State<OKButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: const Text(
        'OK',
        style: TextStyle(fontFamily: 'Feather')
      ),
    );
  }
}


class CancelButton extends StatefulWidget {
  const CancelButton({super.key});

  @override
  State<CancelButton> createState() => _CancelButtonState();
}


class _CancelButtonState extends State<CancelButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(false);
      },
      child: const Text(
        'Cancel',
        style: TextStyle(fontFamily: 'Feather')
      ),
    );
  }
}
