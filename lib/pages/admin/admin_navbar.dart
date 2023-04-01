import 'package:flutter/material.dart';

import 'admin_page_context.dart';

class AdminNavbar extends StatelessWidget {
  // Generate a icon button with a tooltip
  // Icon button should have full screen icon over it.

  NavigationRailDestination destination(
      IconData icon, String label, String tooltip) {
    return NavigationRailDestination(
      icon: Tooltip(
        child: Column(
          children: [
            Icon(icon),
            Text(label, style: TextStyle(color: Colors.black, fontSize: 9)),
          ],
        ),
        message: tooltip,
      ),
      label: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pageContext = AdminPageContextProvider.of(context);
    var selectedIndex = pageContext.notifier!.selectedIndex;
    return Scaffold(
        body: NavigationRail(
      destinations: [
        destination(
          Icons.people,
          "Employees",
          "Employees: You can create, edit and delete employees. You can also assign employees to branches.",
        ),
        destination(
          Icons.home_filled,
          "Branches",
          "Branches: You can create, edit and delete branches. You can also assign employees to branches.",
        )
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        pageContext.notifier!.setSelectedIndex(index);
        (context as Element).markNeedsBuild();
      },
    ));
  }
}
