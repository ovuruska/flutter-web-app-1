import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

class EmployeeInformationCrudState extends Equatable {
  final EmployeeEntity? employee;

  EmployeeInformationCrudState({
    this.employee,
  });

  @override
  List<Object?> get props => [employee ?? -1];
}
