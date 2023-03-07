import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/employee_entity.dart';
import '../../domain/repositories/patch_employee.dart';

class PatchEmployeeRepositoryImpl extends PatchEmployeeRepository {
  @override
  Future<Either<Failure, EmployeeEntity>> patch(
      int id, Map<String, dynamic> data) async {
    var response = await SchedulingAuthService()
        .jsonRequest("/api/employee/$id", method: "PATCH", body: data);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(EmployeeEntity.fromJson(respJson));
    } else {
      return Left(ServerFailure());
    }
  }
}
