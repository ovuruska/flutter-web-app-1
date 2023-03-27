import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../services/auth.dart';
import '../../domain/entities/employee_entity.dart';
import '../../domain/repositories/get_employees_repository.dart';

class GetEmployeesRepositoryImpl implements GetEmployeesRepository {
  GetEmployeesRepositoryImpl();

  @override
  Future<Either<Failure, List<EmployeeEntity>>> getEmployees(
      int branchId) async {
    try {
      var queryParams = {
        'branch': branchId.toString(),
      };
      var response = await SchedulingAuthService.instance
          .request("/api/employees", queryParams: queryParams);

      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      return Right(respJson
          .map<EmployeeEntity>((e) => EmployeeEntity.fromJson(e))
          .toList());
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
