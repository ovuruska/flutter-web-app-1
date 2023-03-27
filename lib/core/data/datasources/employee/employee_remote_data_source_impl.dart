

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/data/datasources/employee/employee_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/core/remote_data_source.dart';

import '../../../../services/auth.dart';
import '../../../domain/constants/roles.dart';
import '../../../error/failures.dart';

class EmployeeRemoteDataSourceImpl extends EmployeeRemoteDataSource{
  Future<Either<Failure,List<EmployeeEntity>>> getGroomers() async {

    var queryParams = {
      "role":EMPLOYEE_FULL_GROOMING.toString()
    };
    var response = await SchedulingAuthService.instance.request(
        '/api/employees',
        queryParams:queryParams
    );
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if(response.statusCode == 200){
      List<EmployeeEntity> employees = [];
      for(var employee in respJson){
        employees.add(EmployeeEntity.fromJson(employee));
      }
      return Right(employees);
    }else{
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, EmployeeEntity>> getEmployee(int id) async {
    var response = await SchedulingAuthService.instance.request(
        '/api/employees/$id'
    );
    if(response.statusCode == 200){
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      return Right(EmployeeEntity.fromJson(respJson));
    }else{
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    var response = await SchedulingAuthService.instance
        .request("/api/employee/$id", method: "DELETE");
    return Right(null);
  }

  @override
  Future<Either<Failure, EmployeeEntity>> patch(EmployeeEntity employee) async {
    var body = employee.toJson();
    var response = await SchedulingAuthService.instance.jsonRequest(
        "/api/employee/${employee.id}",
        method: "PATCH",
        body: body);

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      return Right(EmployeeEntity.fromJson(respJson));
    } else {
      return Left(ServerFailure());
    }
  }
}