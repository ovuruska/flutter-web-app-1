

import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/repositories/branch_repository.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

class BranchEmployeesRepositoryImpl extends BranchEmployeesRepository {
  @override
  Future<Either<Failure, List<DashboardEmployeeEntity>>> getBranchEmployees(int branchId,DateTime date) async {
    var formatter = DateFormat('yyyy-MM-dd');
    var formatted = formatter.format(date);
    var queryParams = {
      "date": formatted
    };
    var response = await SchedulingAuthService.instance.request(
        "/api/branch/$branchId/employees",
        queryParams: queryParams
    );

    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(respJson.map<DashboardEmployeeEntity>((e) => DashboardEmployeeEntity.fromJson(e)).toList());
    } else {
      return Left(ServerFailure());
    }

  }

}