

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_working_hours.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/forms/branch_working_hours/domain/entities/branch_schedule_entity.dart';
import 'package:scrubbers_employee_application/services/auth.dart';
import 'branch_working_hours_remote_data_source.dart';

class BranchWorkingHoursRemoteDataSourceImpl extends BranchWorkingHoursRemoteDataSource {
  Future<Either<Failure, List<BranchWorkingHours>>> getWeeklySchedule(int id,
      DateTime start, DateTime end) async {
    var formatter = new DateFormat('yyyy-MM-dd');
    var queryParams = {
      "start": formatter.format(start),
      "end": formatter.format(end)
    };

    var response = await SchedulingAuthService.instance.request(
      "/api/scheduling/hours/branch/$id",
      queryParams: queryParams,
    );

    if(response.statusCode == 200){
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      List<BranchWorkingHours> branchWorkingHours = respJson.map<BranchWorkingHours>((e) => BranchWorkingHours.fromJson(e)).toList();
      return Right(branchWorkingHours);
    }else{
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<BranchWorkingHours>>> setWeek(
      List<BranchWorkingHours> branchWorkingHours) async {

    var body = jsonEncode(branchWorkingHours.map((e) => e.toJson()).toList());
    var response = await SchedulingAuthService.instance.request(
      '/api/scheduling/hours/branch',
      method: 'POST',
      body: body,
    );

    if(response.statusCode == 200){
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      var branchWorkingHours = respJson.map((e) => BranchWorkingHours.fromJson(e)).toList();
      return Right(branchWorkingHours);
    }
    else{
      return Left(ServerFailure());
    }
  }
}