import 'package:flutter/material.dart';

import '../../features/app_multi_calendar/presentation/pages/app_multi_calendar.dart';
import '../../features/app_select_branch/presentation/pages/app_select_branch.dart';



class CalendarAndBranchView extends StatelessWidget {

  const CalendarAndBranchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          AppSelectBranchView(),
          Container(height: 16),
          Expanded(child: AppMultiCalendarView())
        ]));
  }
}
