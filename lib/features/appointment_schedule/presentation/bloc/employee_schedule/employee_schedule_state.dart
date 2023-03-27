import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';

class EmployeeScheduleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmployeeScheduleInitial extends EmployeeScheduleState {}

class EmployeeScheduleLoading extends EmployeeScheduleState {}

class EmployeeScheduleLoaded extends EmployeeScheduleState {

  final List<SchedulingAppointmentEntity> appointments;
  final int id;

  EmployeeScheduleLoaded({required this.id,this.appointments = const []});

  @override
  List<Object?> get props => [id,appointments];
}
