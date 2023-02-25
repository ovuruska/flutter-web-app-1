import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/constants.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/calendar/controller.dart';

import '../AppointmentCard/View.dart';
import '../sidebar/controller.dart';
import './Calendar.dart';
import '../utils.dart';



class DashboardDailyScheduleInner extends StatelessWidget {
  double topOffsetConstant = 71;
  Employee employee;

  DashboardDailyScheduleInner({required this.employee});



  @override
  Widget build(BuildContext context) {
    var employeeAppointments =
        dashboardBloc.value.filterAppointments().where((appointment) {
      var currentDate = sidebarCalendarBloc.value.selectedDate;
      var appointmentDate = appointment.start;
      if (currentDate.year == appointmentDate.year &&
          currentDate.month == appointmentDate.month &&
          currentDate.day == appointmentDate.day) {
        if (appointment.branch.id == sidebarBloc.value.currentBranch.id) {
          if (appointment.employee.id == employee.id) {
            return true;
          }
        }
      }
      return false;
    }).toList();
    employeeAppointments.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));

    return Stack(
        clipBehavior: Clip.hardEdge,
        children: <Widget>[DashboardDailyScheduleCalendar(employee: employee)] +
            employeeAppointments.map((appointment) {
              var difference = appointment.start
                  .difference(appointment.start.startOfDay.add(Duration(hours:startHour)))
                  .inMinutes;

              CalendarPosition calendarPosition =
                  getCalendarPosition(employeeAppointments, appointment);
              return Positioned(
                width: calendarPosition.width,
                left: calendarPosition.order * calendarPosition.width,
                top: topOffsetConstant + difference / 15 * hourColumnHeight / 4,
                child:ClipRect(
                  clipBehavior: Clip.antiAlias,

                  child:DashboardAppointmentCardDragTarget(dragFunction:acceptWithEmployee(employee),appointment: appointment,width:calendarPosition.width),
                )

              );
            }).toList());
  }
}
