

import 'package:equatable/equatable.dart';

import '../../../../widgets/cards/root/entity.dart';
import '../../domain/entities/dashboard_employee_entity.dart';

class AppointmentScheduleState extends Equatable {
  const AppointmentScheduleState();

  @override
  List<Object> get props => [];
}

class Initial extends AppointmentScheduleState {}

class Loaded extends AppointmentScheduleState {
  final List<DashboardEmployeeEntity> employees;
  final List<DashboardAppointmentEntity> appointments;

  Loaded({
    this.employees = const [],
    this.appointments = const [],
  });

  @override
  List<Object> get props => [employees, appointments];
}