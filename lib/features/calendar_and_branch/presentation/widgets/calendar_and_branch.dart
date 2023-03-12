import 'package:flutter/material.dart';

import '../../domain/entities/branch_id_and_name.dart';
import 'app_calendar_view.dart';
import 'select_branch.dart';

class CalendarAndBranch extends StatelessWidget {
  final List<BranchIdAndName> branches;
  final Function(int)? onBranchSelected;
  final Function(DateTime)? onDateSelected;

  const CalendarAndBranch({
    Key? key,
    required this.branches,
    this.onBranchSelected,
    this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(height: 32),
      SelectBranch(
        branches: branches,
        onBranchSelected: onBranchSelected,
      ),
      Container(height: 16),
      Expanded(child: AppCalendarView(onDateSelected: onDateSelected,))
    ]));
  }
}
