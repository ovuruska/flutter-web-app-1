import 'package:flutter/material.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../common/scheduling/scheduling_context_provider.dart';
import 'daily_column_sidebar.dart';

class DailyColumnScroll extends StatelessWidget {
  final DateTime date;
  final List<SchedulingAppointmentEntity> appointments;
  final int employee;
  final String employeeName;
  final int target;

  const DailyColumnScroll({
    Key? key,
    required this.date,
    required this.appointments,
    required this.employee,
    required this.target,
    required this.employeeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var schedulingContext = SchedulingContextProvider.of(context);

    return SingleChildScrollView(
      controller: schedulingContext.verticalController,
      child: DailyColumnSidebar(
        date: date,
        appointments: appointments,
        employee: employee,
        employeeName: employeeName,
        target: target,
      ),
    );
  }
}
