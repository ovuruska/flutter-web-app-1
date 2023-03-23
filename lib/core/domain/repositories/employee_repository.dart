

import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/employee_entity.dart';

abstract class EmployeeRepository{

  Future<Either<Failure,List<EmployeeEntity>>> getGroomers();

  Future<Either<Failure,EmployeeEntity>> getEmployee(int id);

  Future<Either<Failure, EmployeeEntity>> patch(EmployeeEntity employee);

  Future<Either<Failure, void>> delete(int id);

}