import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';

import '../../features/appointment_schedule/domain/entities/creatable_scheduling_appointment_entity.dart';
import 'scheduling_context.dart';

SchedulingAppointmentEntity calculateAppointmentDetails(SchedulingContext context,DragTargetDetails<SchedulingAppointmentEntity> details,DateTime date,int startHour,int employee){
  var data = details.data;
  var offset = details.offset;
  var dy = offset.dy;

  var absoluteY = dy  - context.headerHeight - context.topOffset + context.verticalController.offset;

  var localPosition = (absoluteY) % context.boxHeight ;
  var hour = (absoluteY) ~/ context.boxHeight;
  hour += startHour;
  var minute = localPosition / (context.boxHeight / 60);

  minute = (minute / 15).floor() * 15;
  var start = data.start;
  var end = data.end;
  var difference = end.difference(start).inMinutes;
  start = DateTime(date.year, date.month, date.day, hour, minute.toInt());
  end = start.add(Duration(minutes: difference));
  data = data.copyWith(
      start:start,end:end,employee:employee
  );
  return data;
}

CreatableSchedulingAppointmentEntity calculateAppointmentDetailsCreatable(SchedulingContext context,DragTargetDetails<SchedulingAppointmentEntity> details,DateTime date,int startHour,int employee){
  var data = details.data as CreatableSchedulingAppointmentEntity;
  var offset = details.offset;
  var dy = offset.dy;

  var absoluteY = dy  - context.headerHeight - context.topOffset + context.verticalController.offset;

  var localPosition = (absoluteY) % context.boxHeight ;
  var hour = (absoluteY) ~/ context.boxHeight;
  hour += startHour;
  var minute = localPosition / (context.boxHeight / 60);

  minute = (minute / 15).floor() * 15;
  var start = data.start;
  var end = data.end;
  var difference = end.difference(start).inMinutes;
  start = DateTime(date.year, date.month, date.day, hour, minute.toInt());
  end = start.add(Duration(minutes: difference));
  data = data.copyWith(
      start:start,end:end,employee:employee
  );
  return data;
}