import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/employee_entity.dart';
import '../../../../../core/error/failures.dart';

abstract class GetAllEmployeesRepository {
  Future<Either<Failure,List<EmployeeEntity>>> get();
}