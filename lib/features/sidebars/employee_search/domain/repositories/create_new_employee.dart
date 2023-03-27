import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/employee_entity.dart';
import '../../../../../core/error/failures.dart';

abstract class CreateNewEmployeeRepository{
  Future<Either<Failure,EmployeeEntity>> create();
}