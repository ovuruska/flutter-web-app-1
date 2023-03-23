import 'package:equatable/equatable.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../domain/entities/creatable_scheduling_appointment_entity.dart';

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
  final SchedulingAppointmentEntity appointment;

  EmployeeSchedulePatchEvent({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class EmployeeScheduleLocalPatchEvent extends EmployeeScheduleEvent {
  final SchedulingAppointmentEntity appointment;

  EmployeeScheduleLocalPatchEvent({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class EmployeeScheduleEventCreate extends EmployeeScheduleEvent {
  final CreatableSchedulingAppointmentEntity appointment;

  EmployeeScheduleEventCreate({required this.appointment});

  @override
  List<Object> get props => [appointment];
}
