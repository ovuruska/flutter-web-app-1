

import 'package:equatable/equatable.dart';

import '../../domain/entities/employee_entity.dart';

class EmployeeSearchState extends Equatable {
  const EmployeeSearchState();

  @override
  List<Object> get props => [];
}

class Initial extends EmployeeSearchState {}

class Loading extends EmployeeSearchState {}

class Loaded extends EmployeeSearchState {
  final List<EmployeeEntity> employees;

  Loaded({required this.employees});

  @override
  List<Object> get props => [employees];
}

class Failed extends EmployeeSearchState {
  final String message;

  Failed({required this.message});

  @override
  List<Object> get props => [message];
}