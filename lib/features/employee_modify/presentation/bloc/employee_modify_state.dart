

import 'package:equatable/equatable.dart';

import '../../domain/entities/employee_entity.dart';

class EmployeeModifyState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Empty extends EmployeeModifyState {}

class Initial extends EmployeeModifyState {}

class Loading extends EmployeeModifyState {}
class Failure extends EmployeeModifyState {
  final String message;

  Failure(this.message);

  @override
  List<Object?> get props => [message];
}
class Loaded extends EmployeeModifyState {
  final EmployeeEntity employee;

  Loaded(this.employee);

  @override
  List<Object?> get props => [employee];
}
class Removed extends EmployeeModifyState {}


