

import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/employee_entity.dart';

class GroomerSelectState extends Equatable {
  final List<EmployeeEntity> options;

  const GroomerSelectState({
    this.options = const []
});

  @override
  List<Object> get props => options;
}