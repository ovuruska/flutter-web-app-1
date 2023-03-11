import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/app_header/presentation/widgets/header.dart';
import '../../features/appointment_schedule/presentation/pages/appointment_schedule.dart';
import '../../features/calendar_and_branch/presentation/pages/calendar_and_branch.dart';
import '../../features/view_appointments/presentation/pages/view_appointments.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  Widget _grid() => LayoutGrid(
        columnSizes: [
          64.px,
          420.px,
          1.fr,
          16.px,
        ],
        rowSizes: [
          48.px,
          480.px,
          1.fr,
          32.px
        ],
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
      AppointmentScheduleView(date: DateTime.now(),branch:1).withGridPlacement(
        rowStart: 1,
        rowSpan: 2,
        columnStart: 2,
        columnSpan: 1,),
      CalendarAndBranchView().withGridPlacement(
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
