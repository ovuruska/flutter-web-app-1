
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/data/datasources/employee_working_hours/employee_working_hours_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entities/daily_schedule_entity.dart';
import '../../domain/repositories/working_hours_repository.dart';


class WorkingHoursRepositoryImpl extends WorkingHoursRepository {

  final EmployeeWorkingHoursRemoteDataSource remoteDataSource;

  WorkingHoursRepositoryImpl(this.remoteDataSource);


  @override
  Future<Either<Failure, List<DailyScheduleEntity>>> get(int employeeId,IntervalEntity intervalEntity) async {
  return await remoteDataSource.getWeeklySchedule(employeeId, intervalEntity.start,intervalEntity.end).then(
      (value) {
        if(value is Left){
          return Left(ServerFailure());


        }else{
          var workingHours = value.getOrElse(() => []);
          var dailyScheduleEntity = workingHours.map<DailyScheduleEntity>((e) => DailyScheduleEntity(
            date: e.date,
            start: e.start,
            end: e.end,
            branch: e.branch, employee: employeeId,
          )).toList();
          return Right(dailyScheduleEntity);
        }
      }
    );
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
