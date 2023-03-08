import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/services/auth.dart';
import 'package:time_machine/time_machine.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/daily_schedule_entity.dart';
import '../../domain/entities/interval_entity.dart';
import '../../domain/repositories/working_hours_repository.dart';


class WorkingHoursRepositoryImpl extends WorkingHoursRepository {


  @override
  Future<Either<Failure, List<DailyScheduleEntity>>> get(int employeeId,IntervalEntity intervalEntity) async {
    // 2022-02-01
    var formatter = new DateFormat('yyyy-MM-dd');
    var queryParams = {
      "start": formatter.format(intervalEntity.start),
      "end": formatter.format(intervalEntity.end),
    };
    var response = await SchedulingAuthService.instance.request(
        "/api/scheduling/hours/employee/${employeeId.toString()}",method:"GET", queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      var workingHours = respJson["working_hours"];
      var employee = respJson["employee"];
      List<DailyScheduleEntity> workingHoursList = workingHours.map<DailyScheduleEntity>((e){
        var branch = e["branch"] == null ? null : e["branch"]["id"];
        var start,end;

        if (e["start"] != null){
          start = DateTime.parse(e["start"]);
          start = TimeOfDay(hour: start.hour, minute: start.minute);
        }
        if (e["end"] != null){
          end = DateTime.parse(e["end"]);
          end = TimeOfDay(hour: end.hour, minute: end.minute);
        }
        var date = DateTime.parse(e["date"]);
        return DailyScheduleEntity(branch:branch,start: start, end: end, date: date, employee: employee["id"]);
      }).toList();
      return Right(workingHoursList);
    } else {
      return Left(ServerFailure());
    }

  }


  @override
  Future<Either<Failure, void>> clear(int employeeId,IntervalEntity interval) {
    var formatter = new DateFormat('yyyy-MM-dd');
    var queryParams = {
      "start": formatter.format(interval.start),
      "end": formatter.format(interval.end),
    };
    // Remove all working hours
    var numberOfDays = interval.end.difference(interval.start).inDays;
    var body = List.generate(numberOfDays+1, (index) => {
      "date": formatter.format(interval.start.add(Duration(days: index))),
      "start": null,
      "end": null,
      "branch": null,
    });

    var response = SchedulingAuthService.instance.jsonRequest("/api/scheduling/hours/employee/${employeeId.toString()}",method:"POST", queryParams: queryParams,body: body);
    return response.then((value) {
      if(value.statusCode == 200){
        return Right(null);
      }else{
        return Left(ServerFailure());
      }
    });
  }

  @override
  Future<Either<Failure, void>> upsert(int employeeId,List<DailyScheduleEntity> workingHours) {

    var jsonObject = workingHours.map((e) => e.toJson()).toList();
    var response = SchedulingAuthService.instance.jsonRequest("/api/scheduling/hours/employee/${employeeId.toString()}",method:"POST", body: jsonObject);
    return response.then((value) {
      if(value.statusCode == 200){
        return Right(null);
      }else{
        return Left(ServerFailure());
      }
    });
  }
}
