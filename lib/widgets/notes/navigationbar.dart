// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BaseNavigationDrawer extends StatefulWidget {
  const BaseNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<BaseNavigationDrawer> createState() => _BaseNavigationDrawerState();
}


class _BaseNavigationDrawerState extends State<BaseNavigationDrawer> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return const NavigationDrawer(
      children: [],
    );
  }
}
