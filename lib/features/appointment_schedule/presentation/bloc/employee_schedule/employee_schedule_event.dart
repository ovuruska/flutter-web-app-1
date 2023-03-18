

import 'package:equatable/equatable.dart';

import '../../../../../widgets/cards/root/entity.dart';

class EmployeeScheduleEvent extends Equatable {
  const EmployeeScheduleEvent();

  @override
  List<Object> get props => [];
}

class EmployeeScheduleGetAppointmentsEvent extends EmployeeScheduleEvent {
  final int id;
  final DateTime start;
  final DateTime end;

  EmployeeScheduleGetAppointmentsEvent({
    required this.id,
    required this.start,
    required this.end,
  });

  @override
  List<Object> get props => [id, start, end];
}

class EmployeeSchedulePatchEvent extends EmployeeScheduleEvent {
  final DashboardAppointmentEntity appointment;

  EmployeeSchedulePatchEvent({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class EmployeeScheduleLocalPatchEvent extends EmployeeScheduleEvent {
  final DashboardAppointmentEntity appointment;

  EmployeeScheduleLocalPatchEvent({required this.appointment});

  @override
  List<Object> get props => [appointment];
}