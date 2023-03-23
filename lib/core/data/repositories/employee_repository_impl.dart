

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

  @override
  Future<Either<Failure, EmployeeEntity>> getEmployee(int id) async {
    return await remoteDataSource.getEmployee(id);
  }

  @override
  Future<Either<Failure, void>> delete(int id) async  {
   return await remoteDataSource.delete(id);
  }

  @override
  Future<Either<Failure, EmployeeEntity>> patch(EmployeeEntity employee) async {
    return await remoteDataSource.patch(employee);
  }

}