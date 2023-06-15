import 'package:cloudnotes/services/database/services.dart';
import 'package:flutter/material.dart';
import 'package:cloudnotes/utils/constants.dart';
import 'package:cloudnotes/utils/logout.dart';
import 'package:cloudnotes/widgets/auth/dialogs.dart';
import 'package:cloudnotes/widgets/notes/dialogs.dart';


enum MenuItem { 
  logout,
  flushCloud,
  flushLocal
}


/// The main app bar visible to the logged out or anonymous user throughout the app lifecycle.
class AnonymousUserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnonymousUserAppBar({super.key});
  static const String _title = 'Cloud Notes';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      foregroundColor: secondaryTextColor,
      backgroundColor: primaryTextColor,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        _title,
        style: TextStyle(
          fontFamily: 'Feather',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


/// The main app bar visible to the logged in user throughout the app lifecycle.
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key, required this.email}) : super(key: key);
  static const String _title = 'My Notes';
  final String email;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      foregroundColor: secondaryTextColor,
      backgroundColor: primaryTextColor,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        _title,
        style: TextStyle(
          fontFamily: 'Feather',
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [PopupMenu(email: email)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class PopupMenu extends StatefulWidget {
  const PopupMenu({Key? key, required this.email}) : super(key: key);
  final String email;

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
          const PopupMenuItem<MenuItem>(
            value: MenuItem.logout,
            child: Text('Log Out'),
          ),
          const PopupMenuItem<MenuItem>(
            value: MenuItem.flushCloud,
            child: Text('Flush Cloud'),
          ),
          const PopupMenuItem<MenuItem>(
            value: MenuItem.flushLocal,
            child: Text('Delete Local Data'),
          ),
        ];
      },
      onSelected: (value) async {
        switch (value) {
          case MenuItem.logout:
            bool shouldLogout = await showLogoutDialog(context);
            logout(shouldLogout);
            if (context.mounted && shouldLogout) {
              Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false);
            }
            break;
          case MenuItem.flushCloud:
            bool shouldFlush = await showFlushCloudDialog(context);
            if (shouldFlush) {
              flushCloudNotesService(widget.email);
            }
            break;
          case MenuItem.flushLocal:
            bool shouldFlush = await showFlushLocalDialog(context);
            if (shouldFlush) {
              flushLocalNotesService(widget.email);
            }
            break;
        }
      },
    );
  }
}
