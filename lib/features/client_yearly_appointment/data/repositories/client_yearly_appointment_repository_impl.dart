

import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'package:scrubbers_employee_application/features/client_yearly_appointment/domain/entities/monthly_appointment_costs.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/repositories/client_yearly_appointment_repository.dart';

class ClientYearlyAppointmentRepositoryImpl extends ClientYearlyAppointmentRepository{
  @override
  Future<Either<Failure, Map<String, MonthlyAppointmentCosts>>> getYearlyAppointmentCosts(int id)async{
    var response = await SchedulingAuthService.instance.request(
      "/api/analytics/customer/yearly_appointment_summary/$id",

    );
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if(response.statusCode == 200){
      Map<String,MonthlyAppointmentCosts> map = {};
      respJson.forEach((key, value) {
        map[key] = MonthlyAppointmentCosts.fromJson(value);
      });
      return Right(map);
    }else{
      return Left(ServerFailure());
    }
  }

}