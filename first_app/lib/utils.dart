import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// The event that gets executed upon pressing the like floating button.
void likeButtonPressed(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        "Thanks for liking us!",
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Quicksand',
        ),
      ),
      action: SnackBarAction(
        label: "Okay",
        onPressed: () {},
      ),
    ),
  );
}

/// The event that gets executed upon pressing the "Purchase" button.
openURL() async {
  final uri = Uri.parse('https://royalthaiart.com/product/black-pink-abstract-art/');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw "Couldn't launch the specific URL";
  }
}