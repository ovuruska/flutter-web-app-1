


import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'package:scrubbers_employee_application/features/employee_search/domain/entities/employee_entity.dart';

import '../../../../services/auth.dart';
import '../../domain/repositories/get_all_employees.dart';

class GetAllEmployeesRepositoryImpl extends GetAllEmployeesRepository{
  @override
  Future<Either<Failure, List<EmployeeEntity>>> get() async {

    var response = await SchedulingAuthService.instance
          .request("/api/employees");
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if(response.statusCode == 200){
      return Right(respJson
          .map<EmployeeEntity>((e) => EmployeeEntity.fromJson(e))
          .toList());
    }else{
      return Left(ServerFailure());
    }
  }


}