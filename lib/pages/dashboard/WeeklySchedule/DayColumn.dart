import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/Legend/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';

import '../AppointmentCard/View.dart';
import '../utils.dart';
import 'Calendar.dart';

class DashboardWeeklyScheduleDayColumn extends StatelessWidget {
  double topOffsetConstant = 71;
  DateTime date;

  DashboardWeeklyScheduleDayColumn({required this.date});

  @override
  Widget build(BuildContext context) {
    var employee = dashboardLegendBloc.value.employee!;
    var employeeAppointments =
        dashboardBloc.value.appointments.where((appointment) {
      var appointmentDate = appointment.start;
      if (appointmentDate.year == date.year &&
          appointmentDate.month == date.month &&
          appointmentDate.day == date.day) {
        if (appointment.employee.id == employee.id) {
          return true;
        }
      }
      return false;
    }).toList();
    employeeAppointments.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));

    return Stack(
        clipBehavior: Clip.hardEdge,
        children: <Widget>[DashboardWeeklyScheduleCalendar(date: date)] +
            employeeAppointments.map((appointment) {
              var difference = appointment.start
                  .difference(appointment.start.startOfDay
                      .add(Duration(hours: startHour)))
                  .inMinutes;

              CalendarPosition calendarPosition =
                  getCalendarPosition(employeeAppointments, appointment);
              return Positioned(
                  width: calendarPosition.width,
                  left: calendarPosition.order * calendarPosition.width,
                  top: topOffsetConstant +
                      difference / 15 * hourColumnHeight / 4,
                  child: ClipRect(
                    clipBehavior: Clip.antiAlias,
                    child: DashboardAppointmentCardDragTarget(
                        dragFunction: acceptWithDateAndEmployee(employee, date),
                        appointment: appointment,
                        width: calendarPosition.width),
                  ));
            }).toList());
  }
}
