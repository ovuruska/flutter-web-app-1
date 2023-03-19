import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../entities/employee_entity.dart';
import '../repositories/get_all_employees.dart';

class GetEmployeesUseCase extends UseCase<List<EmployeeEntity>, NoParams> {
  final GetAllEmployeesRepository repository;

  GetEmployeesUseCase(this.repository);

  @override
  Future<Either<Failure, List<EmployeeEntity>>> call(NoParams params) async {
    return await repository.get();
  }
}