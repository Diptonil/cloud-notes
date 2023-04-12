import 'package:flutter/material.dart';
import 'package:addition/widgets/textfields.dart';

/// The body of the app.
class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: const <Widget>[
            FirstTextInputBox(),
            SecondTextInputBox()
          ]
        ),
      ],
    );
  }
}