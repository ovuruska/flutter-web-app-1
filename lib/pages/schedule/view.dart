import 'package:flutter/material.dart';

import '../../injection.dart';
import 'register.dart';
import 'schedule_collapsed.dart';
import 'schedule_expanded.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  late bool collapsed;
  @override
  void initState() {
    super.initState();
    setState(() {
      collapsed = false;
    });
    registerSchedulePage(sl);
  }

  onCollapse() {
    setState(() {
      collapsed = !collapsed;
    });
  }

  Widget build(BuildContext context) {
    if (collapsed) {
      return ScheduleViewExpanded(
        onExpand: onCollapse,
      );
    } else {
      return ScheduleViewCollapsed(onCollapse: onCollapse);
    }
  }
}
