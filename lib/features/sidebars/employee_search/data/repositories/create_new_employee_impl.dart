import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entities/employee_entity.dart';
import '../../domain/repositories/create_new_employee.dart';

class CreateNewEmployeeRepositoryImpl implements CreateNewEmployeeRepository {
  @override
  Future<Either<Failure,EmployeeEntity>> create() async {

    var response = await SchedulingAuthService.instance.request("/api/employee", method:"POST");
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if(response.statusCode == 201){
      return Right(EmployeeEntity.fromJson(respJson));
    }else{
      return Left(ServerFailure());
    }
  }
}