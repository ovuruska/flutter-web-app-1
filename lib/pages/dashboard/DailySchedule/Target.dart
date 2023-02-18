import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/pages/dashboard/utils.dart';
import '../constants.dart';

class DashboardDailyScheduleDragTarget extends StatelessWidget {
  Widget child;
  Employee employee;

  DashboardDailyScheduleDragTarget(
      {Key? key, required this.child, required this.employee})
      : super(key: key);

  TimeOfDay getTimeOfDay(double dy) {
    var hour = (dy / hourColumnHeight).toInt();
    var minute = (dy % hourColumnHeight / hourColumnHeight * 60).toInt();
    if (minute > 45) {
      minute = 45;
    } else if (minute > 30) {
      minute = 30;
    } else if (minute > 15) {
      minute = 15;
    } else {
      minute = 0;
    }
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Appointment>(
      builder: (context, candidateData, rejectedData) => child,
      onAcceptWithDetails: acceptWithEmployee(employee),
    );
  }
}
