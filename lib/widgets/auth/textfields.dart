import 'package:cloudnotes/utils/constants.dart';
import 'package:flutter/material.dart';


class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key, required this.emailController}) : super(key: key);
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        style: const TextStyle(
          color: primaryTextColor,
        ),
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: true,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(
            color: primaryTextColor,
            fontFamily: 'Feather'
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          )
        ),
      )
    );
  }
}


class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key, required this.passwordController}) : super(key: key);
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        controller: passwordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(
            color: primaryTextColor,
            fontFamily: 'Feather'
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          )
        ), 
        style: const TextStyle(
          color: primaryTextColor,
        ),
      )
    );
  }
}


class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({Key? key, required this.confirmPasswordController}) : super(key: key);
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        controller: confirmPasswordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Confirm Password',
          hintStyle: TextStyle(
            color: primaryTextColor,
            fontFamily: 'Feather'
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor, width: 0.0),
          )
        ), 
        style: const TextStyle(
          color: primaryTextColor,
        ),
      )
    );
  }
}