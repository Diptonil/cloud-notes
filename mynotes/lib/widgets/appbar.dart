import 'package:flutter/material.dart';


enum MenuItem {
  logout
}


/// The main app bar throughout the app lifecycle.
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});
  static const String _title = 'My Notes';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      leading: const Icon(Icons.note_alt_outlined),
      foregroundColor: Colors.black,
      backgroundColor: Colors.amber,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: const Text(
        _title,
        style: TextStyle(
          fontFamily: "Quicksand",
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: const [PopupMenu()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}


class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (context) {
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text('Log Out'),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 0) {
          print('Logout');
        }
      },
    );
  }
}