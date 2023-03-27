import 'package:equatable/equatable.dart';

import '../../domain/entities/branch_entity.dart';
import '../../domain/entities/employee_entity.dart';

class CreateAppointmentBaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends CreateAppointmentBaseState {}

class Loading extends CreateAppointmentBaseState {}

class CreateAppointmentState extends CreateAppointmentBaseState {
  final List<BranchEntity> branches;
  final List<EmployeeEntity> employees;

  CreateAppointmentState({
    required this.branches,
    required this.employees,
  });

  @override
  List<Object> get props => [branches, employees];
}

class Failed extends CreateAppointmentBaseState {
  final String message;

  Failed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
