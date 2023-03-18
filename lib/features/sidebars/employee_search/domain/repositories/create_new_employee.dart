import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/employee_entity.dart';

abstract class CreateNewEmployeeRepository{
  Future<Either<Failure,EmployeeEntity>> create();
}