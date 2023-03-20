

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
}