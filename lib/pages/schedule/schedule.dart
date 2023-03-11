import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/app_header/presentation/widgets/header.dart';
import '../../features/appointment_schedule/presentation/pages/appointment_schedule.dart';
import '../../features/calendar_and_branch/presentation/pages/calendar_and_branch.dart';
import '../../features/view_appointments/presentation/pages/view_appointments.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  DateTime _selectedDate = DateTime.now();
  int _branch = -1;

  @override
  void initState() {
    super.initState();
  }

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
          AppointmentScheduleView(key:ValueKey(_branch.toString() + " " + _selectedDate.toString()),date: _selectedDate, branch: _branch )
              .withGridPlacement(
            rowStart: 1,
            rowSpan: 2,
            columnStart: 2,
            columnSpan: 1,
          ),
          CalendarAndBranchView(
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
            onBranchSelected: (branch) {
              setState(() {
                _branch = branch;
              });
            },
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
