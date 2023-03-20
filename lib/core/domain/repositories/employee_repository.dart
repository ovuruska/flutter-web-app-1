

import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/employee_entity.dart';

abstract class EmployeeRepository{

  Future<Either<Failure,List<EmployeeEntity>>> getGroomers();

}