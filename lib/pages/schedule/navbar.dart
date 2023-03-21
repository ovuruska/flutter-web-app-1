

import 'package:flutter/material.dart';

import 'schedule_page_context.dart';

class ScheduleNavbar extends StatelessWidget {
  // Generate a icon button with a tooltip
  // Icon button should have full screen icon over it.

  @override
  Widget build(BuildContext context) {
    var pageContext = SchedulePageContextProvider.of(context);
    var isFullScreen = pageContext.notifier!.isFullScreen;
    var selectedIndex = pageContext.notifier!.selectedIndex;
    return Scaffold(
        body:NavigationRail(
      destinations: [
        NavigationRailDestination(icon: (isFullScreen) ? Icon(Icons.fullscreen_exit) : Icon(Icons.fullscreen) , label: isFullScreen ? Text('Collapse') : Text('Expand')),

        NavigationRailDestination(
          icon: Icon(Icons.calendar_today),
          label: Text('Calendar'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.add),
          label: Text('Book'),
        ),
      ],
        selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        if (index == 0) {
          pageContext.notifier!.setFullScreen(!isFullScreen);
          (context as Element).markNeedsBuild();
        }else if(index != selectedIndex){
          pageContext.notifier!.setSelectedIndex(index);
          (context as Element).markNeedsBuild();
        }
      },

    ));
  }
}