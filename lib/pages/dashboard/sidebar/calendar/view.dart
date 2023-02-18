import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'controller.dart';
import 'default.dart';
import 'expanded.dart';

class SidebarCalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: sidebarCalendarBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));



  Widget _build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        sidebarCalendarBloc.value.expanded
                ? ElevatedButton(
                    onPressed: () => sidebarCalendarBloc.toggleExpanded(),
                    child: Text("Collapse"))
                : ElevatedButton(
                    onPressed: () => sidebarCalendarBloc.toggleExpanded(),
                    child: Text("Expand")),

        AnimatedSwitcher(
          child: (sidebarCalendarBloc.value.expanded)
              ? SidebarExpandedCalendarView()
              : SidebarDefaultCalendarView(),
          duration: const Duration(milliseconds: 750),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child,alignment: Alignment.bottomCenter,);
          },
        )
      ],
    ));
  }
}
