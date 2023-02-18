import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

import 'controller.dart';
import 'sidebar/calendar/controller.dart';
import 'sidebar/controller.dart';
import 'DailySchedule/Bloc.dart';
import 'constants.dart';

class CalendarPosition {
  int order;
  double width;

  CalendarPosition({required this.order, required this.width});
}

bool sameTime(DateTime a, DateTime b) {
  return a.hour == b.hour && a.minute == b.minute;
}

CalendarPosition getCalendarPosition(
    List<Appointment> appointments, Appointment target) {
  var totalIndices = 1;
  var order = 0;
  bool after = false;

  for (int i = 0; i < appointments.length; i++) {
    var appointment = appointments[i];
    if (appointment.id == target.id) {
      after = true;
    } else {
      if (appointment.end.isBefore(target.start) ||
          sameTime(appointment.end, target.start)) {
        continue;
      } else if (appointment.start.isAfter(target.end) ||
          sameTime(appointment.start, target.end)) {
        continue;
      } else {
        if (!after) {
          order += 1;
        }
        totalIndices += 1;
      }
    }
  }
  return CalendarPosition(order: order, width: itemWidth / totalIndices - 1);
}

TimeOfDay getTimeOfDayFromMinutes(int minutes) {
  return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
}

int getMinutesFromTimeOfDay(TimeOfDay timeOfDay) {
  return timeOfDay.hour * 60 + timeOfDay.minute;
}

Function(DragTargetDetails<Appointment>) acceptWithDateAndEmployee(
    Employee employee, DateTime date) {
  void onAcceptWithDetails(DragTargetDetails<Appointment> details) {
    var appointment = details.data;
    double realDy = max(
        details.offset.dy -
            topOffset +
            dashboardDailyScheduleBloc.value.scrollY,
        0.0);
    var timeOfDay = getTimeOfDay(realDy);

    var newStart = date.startOfDay
        .add(Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute));
    var newEnd = newStart.add(appointment.end.difference(appointment.start));

    var newAppointmentType = dashboardBloc.value.currentService;

    var newAppointment = appointment.update(
      branch: sidebarBloc.value.currentBranch,
      start: newStart,
      status: AppointmentStatus.PENDING,
      end: newEnd,
      appointmentType: newAppointmentType,
      employee: employee,
    );
    dashboardBloc.patchAppointment(newAppointment);

    AppointmentRepository.instance.patchAppointment(newAppointment);
  }

  return onAcceptWithDetails;
}

Function(DragTargetDetails<Appointment>) acceptWithEmployee(Employee employee) {
  void onAcceptWithDetails(DragTargetDetails<Appointment> details) {
    var appointment = details.data;
    double realDy = max(
        details.offset.dy -
            topOffset +
            dashboardDailyScheduleBloc.value.scrollY,
        0.0);
    var timeOfDay = getTimeOfDay(realDy);

    var newStart = sidebarCalendarBloc.value.selectedDate.startOfDay
        .add(Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute));

    var newEnd = newStart.add(appointment.end.difference(appointment.start));

    var newAppointmentType = dashboardBloc.value.currentService;

    var newAppointment = appointment.update(
      branch: sidebarBloc.value.currentBranch,
      start: newStart,
      status: AppointmentStatus.PENDING,
      end: newEnd,
      employee: employee,
      appointmentType: newAppointmentType,
    );

    dashboardBloc.patchAppointment(newAppointment);
    AppointmentRepository.instance.patchAppointment(newAppointment);
  }

  return onAcceptWithDetails;
}

TimeOfDay getTimeOfDay(double dy) {
  var hour = (dy / hourColumnHeight).toInt() + startHour;
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
