import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/employee_entity.dart';

abstract class EmployeeModifyRepository {
  Future<Either<Failure, EmployeeEntity>> get(int id);

  Future<Either<Failure, EmployeeEntity>> patch(EmployeeEntity employee);

  Future<Either<Failure, EmployeeEntity>> delete(int id);
}
