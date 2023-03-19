import 'package:dartz/dartz.dart';


import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/create_new_employee.dart';

class CreateNewEmployeeUseCase extends UseCase<EmployeeEntity,NoParams>{
  final CreateNewEmployeeRepository repository;

  CreateNewEmployeeUseCase(this.repository);

  @override
  Future<Either<Failure, EmployeeEntity>> call(NoParams params) {
    return repository.create();
  }

}