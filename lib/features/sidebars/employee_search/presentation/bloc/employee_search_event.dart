import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/domain/entities/employee_entity.dart';


@immutable
class EmployeeSearchEvent extends Equatable {
  const EmployeeSearchEvent();

  @override
  List<Object> get props => [];
}

class EmployeeSearchEventCreate extends EmployeeSearchEvent {

  EmployeeSearchEventCreate();

  @override
  List<Object> get props => [];
}
class EmployeeSearchEventRemove extends EmployeeSearchEvent {
  final int id;

  EmployeeSearchEventRemove({required this.id});

  @override
  List<Object> get props => [id];
}

class EmployeeSearchEventGet extends EmployeeSearchEvent {

  EmployeeSearchEventGet();

  @override
  List<Object> get props => [];
}

class EmployeeSearchEventPatch extends EmployeeSearchEvent {
  final EmployeeEntity employee;

  EmployeeSearchEventPatch({required this.employee});

  @override
  List<Object> get props => [employee];
}



class EmployeeSearchEventSetEmployees extends EmployeeSearchEvent {
  final List<EmployeeEntity> employees;

  EmployeeSearchEventSetEmployees({required this.employees});

  @override
  List<Object> get props => [employees];
}