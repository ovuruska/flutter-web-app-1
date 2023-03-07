

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../models/Branch.dart';
import '../../domain/entities/employee_entity.dart';

@immutable
class EmployeeSearchEvent extends Equatable {
  const EmployeeSearchEvent();

  @override
  List<Object> get props => [];
}

class CreateNewEmployeeEvent extends EmployeeSearchEvent {

  CreateNewEmployeeEvent();

  @override
  List<Object> get props => [];
}
class RemoveEmployeeEvent extends EmployeeSearchEvent {
  final int id;

  RemoveEmployeeEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetEmployeesEvent extends EmployeeSearchEvent {

  GetEmployeesEvent();

  @override
  List<Object> get props => [];
}

class PatchEmployeeEvent extends EmployeeSearchEvent {
  final EmployeeEntity employee;

  PatchEmployeeEvent({required this.employee});

  @override
  List<Object> get props => [employee];
}



class SetEmployeesEvent extends EmployeeSearchEvent {
  final List<EmployeeEntity> employees;

  SetEmployeesEvent({required this.employees});

  @override
  List<Object> get props => [employees];
}