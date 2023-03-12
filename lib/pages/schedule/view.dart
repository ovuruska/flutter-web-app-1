import 'package:flutter/material.dart';
import 'schedule_collapsed.dart';
import 'schedule_expanded.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  DateTime _selectedDate = DateTime.now();
  int _branch = -1;
  bool collapsed = false;
  @override
  void initState() {
    super.initState();
  }

  onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  onBranchSelected(int branch) {
    setState(() {
      _branch = branch;
    });
  }

  onCollapse() {
    setState(() {
      collapsed = !collapsed;
    });
  }

  Widget build(BuildContext context) {
    if (collapsed) {
      return ScheduleViewCollapsed(
        onExpand: onCollapse,
        selectedDate: _selectedDate,
        branch: _branch,
      );
    } else {
      return ScheduleViewExpanded(
          onCollapse: onCollapse,
          selectedDate: _selectedDate,
          branch: _branch,
          onDateSelected: onDateSelected,
          onBranchSelected: onBranchSelected);
    }
  }
}
