import 'package:flutter/material.dart';

/// The main app bar throughout the app lifecycle.
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});
  static const String _title = 'All in All';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: const Icon(Icons.calculate_rounded),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}