import 'package:flutter/material.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../common/scheduling/scheduling_daily_calendar_column.dart';
import '../../utils/on_accept_with_details.dart';

class DailyColumnSidebar extends StatelessWidget {
  final DateTime date;
  final List<SchedulingAppointmentEntity> appointments;
  final String employeeName;
  final int employee;
  final int target;

  const DailyColumnSidebar(
      {Key? key,
      required this.date,
      required this.appointments,
      required this.employeeName,
      required this.employee,
      required this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filteredAppointments =
        appointments.map<SchedulingAppointmentEntity>((element) {
      if (element.id == target) {
        return element..editable = true;
      } else {
        return element..editable = false;
      }
    }).toList();

    return SchedulingDailyCalendarColumn(
        appointments: filteredAppointments,
        onAccept:onAcceptWithContext(context),
        header: employeeName,
        employeeId: employee,
        date: date);
  }
}
