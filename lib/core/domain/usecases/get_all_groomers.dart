

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/employee_repository.dart';

class GetAllGroomersUseCase extends UseCase<List<EmployeeEntity>, NoParams> {
  final EmployeeRepository repository;

  GetAllGroomersUseCase(this.repository);

  @override
  Future<Either<Failure, List<EmployeeEntity>>> call(NoParams params) async {
    return await repository.getGroomers();
  }

}