import 'package:cloudnotes/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloudnotes/widgets/notes/screens.dart';


class BaseNavigationDrawer extends StatelessWidget {
  const BaseNavigationDrawer({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ]
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: primaryTextColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('All Notes'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(email: email),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.backup),
          title: const Text('Cloud Backup'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CloudHomeScreen(email: email),
              ),
            );
          },
        ),
        const Divider(),

      ],
    );
  }
}
