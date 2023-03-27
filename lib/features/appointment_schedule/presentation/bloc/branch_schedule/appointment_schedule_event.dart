import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';

import '../../../domain/entities/creatable_scheduling_appointment_entity.dart';

class AppointmentScheduleEvent extends Equatable {
  const AppointmentScheduleEvent();

  @override
  List<Object> get props => [];
}

class AppointmentScheduleEventSetBranch extends AppointmentScheduleEvent {
  final int branch;

  AppointmentScheduleEventSetBranch({required this.branch});

  @override
  List<Object> get props => [branch];
}

class AppointmentScheduleEventInitialize extends AppointmentScheduleEvent {
  @override
  List<Object> get props => [];
}

class AppointmentScheduleEventGetEmployees extends AppointmentScheduleEvent {
  final DateTime date;
  final int branch;

  AppointmentScheduleEventGetEmployees({
    required this.date,
    required this.branch,
  });

  @override
  List<Object> get props => [date, branch];
}

class AppointmentScheduleEventPatchLocal extends AppointmentScheduleEvent {
  final SchedulingAppointmentEntity appointment;

  AppointmentScheduleEventPatchLocal({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class AppointmentScheduleEventPatch extends AppointmentScheduleEvent {
  final SchedulingAppointmentEntity appointment;

  AppointmentScheduleEventPatch({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class AppointmentScheduleEventGetAppointments extends AppointmentScheduleEvent {
  final DateTime date;
  final int? branch;

  AppointmentScheduleEventGetAppointments({
    required this.date,
    this.branch,
  });

  @override
  List<Object> get props => [date, branch ?? -1];
}

class AppointmentScheduleEventCreate extends AppointmentScheduleEvent {
  final CreatableSchedulingAppointmentEntity appointment;

  AppointmentScheduleEventCreate({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class AppointmentScheduleEventGoTo extends AppointmentScheduleEvent {
  final DateTime date;
  final int id;

  AppointmentScheduleEventGoTo({
    required this.id,
    required this.date,
  });
}
