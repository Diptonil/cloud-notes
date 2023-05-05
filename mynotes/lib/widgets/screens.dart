import 'package:flutter/material.dart';
import 'package:mynotes/widgets/body.dart';
import 'package:mynotes/widgets/appbar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: Center(child: LoginBody()),
    );
  }
}


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: Center(child: RegisterBody()),
    );
  }
}


class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: Center(child: EmailConfirmationBody()),
    );
  }
}