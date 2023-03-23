import 'package:flutter/material.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "First App",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontFamily: 'Quicksand',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink[200],
        ),
        body: const Center(
          child: BodyWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Cannot be clicked yet.",
          onPressed: () {},
          backgroundColor: Colors.pink[200],
          child: const Text("Hi!"),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(237, 247, 26, 100)),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "Some help upon clicking.",
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
      },
      child: const Text(
        "Show Snackbar",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontFamily: 'Quicksand',
        ),
      ),
    );
  }
}