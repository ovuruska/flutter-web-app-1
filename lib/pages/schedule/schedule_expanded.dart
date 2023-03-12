import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/app_header/presentation/widgets/header.dart';
import '../../features/appointment_schedule/presentation/pages/appointment_schedule.dart';
import '../../features/calendar_and_branch/presentation/pages/calendar_and_branch.dart';
import '../../features/view_appointments/presentation/pages/view_appointments.dart';
import 'navbar.dart';

class ScheduleViewExpanded extends StatelessWidget {
  const ScheduleViewExpanded({Key? key, required this.onDateSelected, required this.onBranchSelected, required this.selectedDate, required this.branch, required this.onCollapse}) : super(key: key);
  final Function(DateTime) onDateSelected ;
  final Function(int) onBranchSelected ;
  final DateTime selectedDate;
  final int branch;
  final Function() onCollapse;

  Widget _grid() => LayoutGrid(
        columnSizes: [
          64.px,
          420.px,
          1.fr,
          16.px,
        ],
        rowSizes: [48.px, 480.px, 1.fr, 32.px],
        rowGap: 16,
        columnGap: 16,
        children: [
          AppHeader().withGridPlacement(
            rowStart: 0,
            rowSpan: 1,
            columnStart: 0,
            columnSpan: 4,
          ),
          ViewAppointmentsPage().withGridPlacement(
            rowStart: 2,
            rowSpan: 1,
            columnStart: 1,
            columnSpan: 1,
          ),
          ScheduleNavbar(onPressed: onCollapse, isFullScreen: false,).withGridPlacement(
            rowStart: 1,
            rowSpan: 3,
            columnStart: 0,
            columnSpan: 1,
          ),

          AppointmentScheduleView(key:ValueKey(branch.toString() + " " + selectedDate.toString()),date: selectedDate, branch: branch )
              .withGridPlacement(
            rowStart: 1,
            rowSpan: 2,
            columnStart: 2,
            columnSpan: 1,
          ),
          CalendarAndBranchView(
            onDateSelected: onDateSelected,
            onBranchSelected:onBranchSelected,
          ).withGridPlacement(
            rowStart: 1,
            rowSpan: 1,
            columnStart: 1,
            columnSpan: 1,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _grid(),
      backgroundColor: const Color(0xFFFAFAFA),
    );
  }
}