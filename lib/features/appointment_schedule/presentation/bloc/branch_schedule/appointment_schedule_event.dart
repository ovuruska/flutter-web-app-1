import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/entities/branch_id_and_name.dart';



class AppointmentScheduleEvent extends Equatable {
  const AppointmentScheduleEvent();

  @override
  List<Object> get props => [];
}

class AppointmentScheduleSetBranchEvent extends AppointmentScheduleEvent {
  final int branch;

  AppointmentScheduleSetBranchEvent({
    required this.branch
  });

  @override
  List<Object> get props => [branch];
}

class AppointmentScheduleInitializeEvent extends AppointmentScheduleEvent {

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

class AppointmentSchedulePatchLocalEvent extends AppointmentScheduleEvent {

  final SchedulingAppointmentEntity appointment;

  AppointmentSchedulePatchLocalEvent({
    required this.appointment
  });

  @override
  List<Object> get props => [appointment];
}

class AppointmentSchedulePatchEvent extends AppointmentScheduleEvent {

  final SchedulingAppointmentEntity appointment;

  AppointmentSchedulePatchEvent({
    required this.appointment
  });

  @override
  List<Object> get props => [appointment];
}

class AppointmentScheduleGetAppointmentsEvent extends AppointmentScheduleEvent {
  final DateTime date;
  final int? branch;

  AppointmentScheduleGetAppointmentsEvent({
    required this.date,
    this.branch,
  });

  @override
  List<Object> get props => [date,branch ?? -1];
}