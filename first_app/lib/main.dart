import 'package:flutter/material.dart';

void main() {
  runApp(const RootWidget());
}

/// The root of the widget tree.
class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeWidget(),
    );
  }
}

/// The home widget nested into the root widget.
class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Image Viewer",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(237, 247, 26, 100),
        ),
        body: const Center(
          child: BodyWidget(),
        ),
        floatingActionButton: const LikeWidget(),
      );
  }
}

/// The body widget nested into the home widget's body.
class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20.0),
          child: const Text(
            "Use this app to view random images to your heart's content.",
            style: TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(237, 247, 26, 100),
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: const Image(
            image: AssetImage('assets/img1.jpg'),
            height: 300,
            width: 300,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: const ButtonWidget(),
        ),
      ],
    );
  }
}

/// The button for changing the image within the body.
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(237, 247, 26, 100)),
      ),
      onPressed: () {},
      child: const Text(
        "Refresh Image",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          letterSpacing: 1.2,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// The button for liking a particular photo.
class LikeWidget extends StatelessWidget {
  const LikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Like us!.",
      onPressed: () {
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
      },
      backgroundColor: const Color.fromARGB(237, 247, 26, 100),
      child: const Icon(Icons.thumb_up, color: Colors.black,),
    );
  }
}