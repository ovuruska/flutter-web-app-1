import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../domain/entities/employee_working_hours.dart';
import '../../../error/failures.dart';
import 'employee_working_hours_remote_data_source.dart';

class EmployeeWorkingHoursRemoteDataSourceImpl
    extends EmployeeWorkingHoursRemoteDataSource {
  Future<Either<Failure, List<EmployeeWorkingHours>>> getWeeklySchedule(int id,
      DateTime start, DateTime end) async {
    var formatter = new DateFormat('yyyy-MM-dd');
    var queryParams = {
      "start": formatter.format(start),
      "end": formatter.format(end)
    };

    var response = await SchedulingAuthService.instance.request(
      "/api/scheduling/hours/employee/$id",
      queryParams: queryParams,
    );

    if(response.statusCode == 200){
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      List<EmployeeWorkingHours> employeeWorkingHours = respJson.map<EmployeeWorkingHours>((e) => EmployeeWorkingHours.fromJson(e)).toList();
      return Right(employeeWorkingHours);
    }else{
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<EmployeeWorkingHours>>> setWeek(
      List<EmployeeWorkingHours> employeeWorkingHours) async {

    var body = jsonEncode(employeeWorkingHours.map((e) => e.toJson()).toList());
    var response = await SchedulingAuthService.instance.request(
      '/api/scheduling/hours/employee',
      method: 'POST',
      body: body,
    );

    if(response.statusCode == 200){
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      var employeeWorkingHours = respJson.map((e) => EmployeeWorkingHours.fromJson(e)).toList();
      return Right(employeeWorkingHours);
    }
    else{
      return Left(ServerFailure());
    }
  }
}