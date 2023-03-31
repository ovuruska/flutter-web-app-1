import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch_working_hours/branch_working_hours_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/branch_working_hours_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/forms/branch_working_hours/domain/entities/branch_schedule_entity.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

class BranchWorkingHoursRepositoryImpl extends BranchWorkingHoursRepository {
  final BranchWorkingHoursRemoteDataSource remoteDataSource;

  BranchWorkingHoursRepositoryImpl(this.remoteDataSource);


  @override
  Future<Either<Failure, List<BranchScheduleEntity>>> get(int employeeId,
      IntervalEntity intervalEntity) async {
    return await remoteDataSource.getWeeklySchedule(
        employeeId, intervalEntity.start, intervalEntity.end).then((value) {
      if (value is Left) {
        return Left(ServerFailure());
      } else {
        var workingHours = value.getOrElse(() => []);
        var dailyScheduleEntity = workingHours.map<BranchScheduleEntity>((e) =>
            BranchScheduleEntity(
              date: e.date,
              start: e.start,
              end: e.end,
              branch: e.branch?.id)).toList();
        return Right(dailyScheduleEntity);
      }
    });
  }


  @override
  Future<Either<Failure, void>> clear(int id, IntervalEntity interval) {
    var formatter = new DateFormat('yyyy-MM-dd');
    var queryParams = {
      "start": formatter.format(interval.start),
      "end": formatter.format(interval.end),
    };
    // Remove all working hours
    var numberOfDays = interval.end
        .difference(interval.start)
        .inDays;
    var body = List.generate(numberOfDays + 1, (index) =>
    {
      "date": formatter.format(interval.start.add(Duration(days: index))),
      "start": null,
      "end": null,
      "branch": null,
    });

    var response = SchedulingAuthService.instance.jsonRequest(
        "/api/scheduling/hours/branch/${id.toString()}",
        method: "POST", queryParams: queryParams, body: body);
    return response.then((value) {
      if (value.statusCode == 200) {
        return Right(null);
      } else {
        return Left(ServerFailure());
      }
    });
  }

  @override
  Future<Either<Failure, void>> upsert(int id,
      List<BranchScheduleEntity> workingHours) {
    var jsonObject = workingHours.map((e) => e.toJson()).toList();
    var response = SchedulingAuthService.instance.jsonRequest(
        "/api/scheduling/hours/branch/${id.toString()}",
        method: "POST", body: jsonObject);
    return response.then((value) {
      if (value.statusCode == 200) {
        return Right(null);
      } else {
        return Left(ServerFailure());
      }
    });
  }
}
