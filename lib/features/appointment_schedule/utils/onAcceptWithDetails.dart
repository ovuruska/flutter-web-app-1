

import 'package:flutter/material.dart';

import '../../../injection.dart';
import '../../../widgets/cards/root/entity.dart';
import '../presentation/bloc/appointment_schedule/appointment_schedule_bloc.dart';
import '../presentation/bloc/appointment_schedule/appointment_schedule_event.dart';
import 'constants.dart';

onAcceptWithDetails(DateTime date,int startHour,int employee) => (DragTargetDetails<DashboardAppointmentEntity> details) {
  var data = details.data;
  var offset = details.offset;
  var dy = offset.dy;

  var absoluteY = dy - headerHeight - 64 - 96 + verticalController.offset;

  var localPosition = (absoluteY) % boxHeight ;
  var hour = (absoluteY) ~/ boxHeight;
  hour += startHour;
  var minute = localPosition / (boxHeight / 60);

  minute = (minute / 15).round() * 15;
  var start = data.start;
  var end = data.end;
  var difference = end.difference(start).inMinutes;
  start = DateTime(date.year, date.month, date.day, hour, minute.toInt());
  end = start.add(Duration(minutes: difference));
  data = data.copyWith(
    start:start,end:end,employee:employee
  );

  sl<AppointmentScheduleBloc>().add(
    AppointmentSchedulePatchEvent(appointment: data),
  );

};