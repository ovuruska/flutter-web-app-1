import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

class EmployeeInformationCrudEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmployeeInformationCrudEventGet extends EmployeeInformationCrudEvent {
  final int id;

  EmployeeInformationCrudEventGet({required this.id});

  @override
  List<Object?> get props => [id];
}

class EmployeeInformationCrudEventSet extends EmployeeInformationCrudEvent {
  final EmployeeEntity employee;
  EmployeeInformationCrudEventSet({required this.employee});

  @override
  List<Object?> get props => [employee];
}

class EmployeeInformationCrudEventPatch extends EmployeeInformationCrudEvent {
  final EmployeeEntity employee;
  EmployeeInformationCrudEventPatch({required this.employee});

  @override
  List<Object?> get props => [employee];
}
