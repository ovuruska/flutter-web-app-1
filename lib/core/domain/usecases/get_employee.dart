

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../error/failures.dart';
import '../../use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/employee_repository.dart';

class GetEmployeeParams extends Equatable {
  final int id;

  GetEmployeeParams(this.id);

  @override
  List<Object?> get props => [id];
}

class GetEmployeeUseCase extends UseCase<EmployeeEntity, GetEmployeeParams> {
  final EmployeeRepository repository;

  GetEmployeeUseCase(this.repository);

  @override
  Future<Either<Failure, EmployeeEntity>> call(GetEmployeeParams params) async {
    return await repository.getEmployee(params.id);
  }
}