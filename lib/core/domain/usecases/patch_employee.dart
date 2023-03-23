

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../error/failures.dart';
import '../../use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/employee_repository.dart';

class PatchEmployeeParams extends Equatable {
  final EmployeeEntity employee;

  PatchEmployeeParams({required this.employee});

  @override
  List<Object?> get props => [employee];
}

class PatchEmployeeUseCase extends UseCase<EmployeeEntity,PatchEmployeeParams>{
  final EmployeeRepository repository;

  PatchEmployeeUseCase(this.repository);

  @override
  Future<Either<Failure,EmployeeEntity>> call(PatchEmployeeParams params) async {
    return await repository.patch(params.employee);
  }

}