

import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'package:scrubbers_employee_application/features/employee_modify/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/repositories/employee_modify_repository.dart';

class EmployeeModifyRepositoryImpl extends EmployeeModifyRepository {
  @override
  Future<Either<Failure, void>> delete(int id) async {
    var response = await SchedulingAuthService.instance.request("/api/employee/$id", method:"DELETE");
    return Right(null);
  }

  @override
  Future<Either<Failure, EmployeeEntity>> get(int id) async {
    try{
      var response = await SchedulingAuthService.instance.request("/api/employee/$id", method:"GET");
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      if(response.statusCode == 200) {
        return Right(EmployeeEntity.fromJson(respJson));
      }
      else{
        return Left(ServerFailure());
      }
    }
    catch(e){
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, EmployeeEntity>> patch(EmployeeEntity employee) {
    // TODO: implement patch
    throw UnimplementedError();
  }



}