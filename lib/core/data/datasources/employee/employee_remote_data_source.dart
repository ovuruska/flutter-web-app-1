

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/core/remote_data_source.dart';

import '../../../error/failures.dart';

abstract class EmployeeRemoteDataSource extends RemoteDataSource{
  Future<Either<Failure,List<EmployeeEntity>>> getGroomers();
}