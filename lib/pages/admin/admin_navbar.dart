import 'package:flutter/material.dart';

import 'admin_page_context.dart';

class AdminNavbar extends StatelessWidget {
  // Generate a icon button with a tooltip
  // Icon button should have full screen icon over it.

  @override
  Widget build(BuildContext context) {
    var pageContext = AdminPageContextProvider.of(context);
    var selectedIndex = pageContext.notifier!.selectedIndex;
    return Scaffold(
        body:NavigationRail(
          destinations: [

            NavigationRailDestination(
              icon: Tooltip(
                  child:Icon(Icons.people),
                  message: 'Employees: You can create, edit and delete employees. You can also assign employees to branches.'),
                label: Text("Employees"),
              ),
            NavigationRailDestination(
              icon: Tooltip(
                  child:Icon(Icons.home_filled),
                  message: 'Branches: You can create, edit and delete branches. You can also assign employees to branches.'),
              label: Text("Branches"),
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            pageContext.notifier!.setSelectedIndex(index);
            (context as Element).markNeedsBuild();
          },

        ));
  }
}