import 'dart:convert' show jsonDecode;
import 'package:dartz/dartz.dart';



import '../../../../../core/error/failures.dart';
import '../../../../../services/auth.dart';
import '../../domain/entities/employee_entity.dart';
import '../../domain/repositories/employee_modify_repository.dart';

class EmployeeModifyRepositoryImpl extends EmployeeModifyRepository {
  @override
  Future<Either<Failure, void>> delete(int id) async {
    var response = await SchedulingAuthService.instance
        .request("/api/employee/$id", method: "DELETE");
    return Right(null);
  }

  @override
  Future<Either<Failure, EmployeeEntity>> get(int id) async {
    try {
      var response = await SchedulingAuthService.instance
          .request("/api/employee/$id", method: "GET");
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      if (response.statusCode == 200) {
        return Right(EmployeeEntity.fromJson(respJson));
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, EmployeeEntity>> patch(EmployeeEntity employee) async {
    var body = employee.toJson();
    var response = await SchedulingAuthService.instance.jsonRequest(
        "/api/employee/${employee.id}",
        method: "PATCH",
        body: body);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(EmployeeEntity.fromJson(respJson));
    } else {
      return Left(ServerFailure());
    }
  }
}
