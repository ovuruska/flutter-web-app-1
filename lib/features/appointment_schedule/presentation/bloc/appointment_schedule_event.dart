

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/dashboard_appointment_entity.dart';

class AppointmentScheduleEvent extends Equatable {
  const AppointmentScheduleEvent();

  @override
  List<Object> get props => [];
}

class AppointmentScheduleGetEmployeesEvent extends AppointmentScheduleEvent {
  final DateTime date;
  final int branch;

  AppointmentScheduleGetEmployeesEvent({
    required this.date,
    required this.branch,
  });

  @override
  List<Object> get props => [date,branch];
}


class AppointmentSchedulePatchEvent extends AppointmentScheduleEvent {

  final DashboardAppointmentEntity appointment;

  AppointmentSchedulePatchEvent({
    required this.appointment
  });

  @override
  List<Object> get props => [appointment];
}

class AppointmentScheduleGetAppointmentsEvent extends AppointmentScheduleEvent {
  final DateTime date;
  final int branch;

  AppointmentScheduleGetAppointmentsEvent({
    required this.date,
    required this.branch,
  });

  @override
  List<Object> get props => [date,branch];
}