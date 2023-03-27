import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/pages/appointment_schedule_parent.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/pages/schedule_header.dart';

import 'appointment_schedule.dart';
import 'appointment_schedule_parent_headless.dart';

class AppointmentScheduleLayoutHeadless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [
        1.fr
      ],
      rowSizes: [96.px, 1.fr],
      children: [
        ScheduleHeaderView().withGridPlacement(
          rowStart: 0,
          rowSpan: 1,
          columnStart: 0,
          columnSpan: 1,
        ),
        AppointmentScheduleParentHeadlessView().withGridPlacement(
          rowStart: 1,
          rowSpan: 1,
          columnStart: 0,
          columnSpan: 1,
        )
      ],
    );
  }

}