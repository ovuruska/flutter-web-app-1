

import 'package:flutter/material.dart';

import '../../../injection.dart';
import '../domain/entities/dashboard_appointment_entity.dart';
import '../presentation/bloc/appointment_schedule_bloc.dart';
import '../presentation/bloc/appointment_schedule_event.dart';
import 'constants.dart';

onAcceptWithDetails(int startHour) => (DragTargetDetails<DashboardAppointmentEntity> details) {
  var data = details.data;
  var offset = details.offset;
  var dy = offset.dy;
  var absoluteY = dy - headerHeight;

  var localPosition = (absoluteY) % boxHeight ;
  var hour = (absoluteY) ~/ boxHeight;
  hour += startHour;
  var minute = localPosition / (boxHeight / 60);

  // 0 15 30 45
  minute = (minute / 15).round() * 15;

  var start = data.start;
  var end = data.end;
  var difference = end.difference(start).inMinutes;
  start = DateTime(start.year, start.month, start.day, hour, minute.toInt());
  end = start.add(Duration(minutes: difference));

  data = data.copyWith(
    start:start,end:end
  );

  sl<AppointmentScheduleBloc>().add(
    AppointmentSchedulePatchEvent(appointment: data),
  );

};