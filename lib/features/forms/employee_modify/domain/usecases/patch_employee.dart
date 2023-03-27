import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/employee_modify_repository.dart';

class PatchEmployeeParams extends Equatable {
  final EmployeeEntity employee;

  const PatchEmployeeParams({required this.employee});

  @override
  List<Object> get props => [employee];
}

class PatchEmployeeUseCase extends UseCase<EmployeeEntity, PatchEmployeeParams> {
  final EmployeeModifyRepository repository;

  PatchEmployeeUseCase(this.repository);

  @override
  List<Object> get props => [];

  @override
  Future<Either<Failure, EmployeeEntity>> call(PatchEmployeeParams params) async {
    return await repository.patch(params.employee);

  }
}