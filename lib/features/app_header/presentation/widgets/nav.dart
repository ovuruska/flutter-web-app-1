

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants.dart';
import 'nav_button.dart';

class AppHeaderNav extends StatefulWidget {
  const AppHeaderNav({Key? key}) : super(key: key);

  @override
  _AppHeaderNavState createState() => _AppHeaderNavState();
}

class _AppHeaderNavState extends State<AppHeaderNav> {
  @override
  Widget build(BuildContext context) {
    var currentRoute = GoRouter.of(context).location.replaceAll("/", "");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: pages.map<Widget>((page) {
        var text = page[0];
        var route = page[1];

        return AppHeaderNavButton(
          text: text,
          route: route,
          selected: currentRoute.startsWith(route.toLowerCase()),
        );
      }).toList()
    );
  }
}