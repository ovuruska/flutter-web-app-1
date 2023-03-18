import 'package:equatable/equatable.dart';

import '../../domain/entities/employee_entity.dart';

class EmployeeModifyEvent extends Equatable {
  const EmployeeModifyEvent();

  @override
  List<Object> get props => [];
}

class EmployeeModifySaveEvent extends EmployeeModifyEvent {
  final EmployeeEntity employee;

  EmployeeModifySaveEvent(this.employee);

  @override
  List<Object> get props => [employee];
}

class EmployeeModifyRemoveEvent extends EmployeeModifyEvent {
  final int id;

  EmployeeModifyRemoveEvent(this.id);

  @override
  List<Object> get props => [id];
}

class EmployeeModifySetEvent extends EmployeeModifyEvent {
  final int id;

  EmployeeModifySetEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
