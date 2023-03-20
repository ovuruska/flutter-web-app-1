

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/data/datasources/employee/employee_remote_data_source.dart';

import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;

  EmployeeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<EmployeeEntity>>> getGroomers() async {
    return await remoteDataSource.getGroomers();
  }

}