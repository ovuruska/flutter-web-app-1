

import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/employee_entity.dart';

class MultiGroomerSelectState extends Equatable {
  final List<EmployeeEntity> options;

  const MultiGroomerSelectState({
    this.options = const []
});

  @override
  List<Object> get props => options;
}