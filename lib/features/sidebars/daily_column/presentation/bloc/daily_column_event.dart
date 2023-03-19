

import 'package:equatable/equatable.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';

class DailyColumnEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class DailyColumnEventSetTarget extends DailyColumnEvent {

  final int employee;
  final DateTime date;
  final int target;
  final String employeeName;

  DailyColumnEventSetTarget({
    required this.employee,
    required this.employeeName,
    required this.date,
    required this.target,
  });

  @override
  List<Object?> get props => [employee, date, target,employeeName];
}

class DailyColumnEventPatchAppointment extends DailyColumnEvent {
  final SchedulingAppointmentEntity appointment;

  DailyColumnEventPatchAppointment({
    required this.appointment,
  });

  @override
  List<Object?> get props => [appointment];
}

class DailyColumnEventPatchLocalAppointment extends DailyColumnEvent {
  final SchedulingAppointmentEntity appointment;

  DailyColumnEventPatchLocalAppointment({
    required this.appointment,
  });

  @override
  List<Object?> get props => [appointment];
}

