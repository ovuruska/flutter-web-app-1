import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../entities/daily_schedule_entity.dart';
import '../entities/interval_entity.dart';
import '../repositories/working_hours_repository.dart';
import 'package:collection/collection.dart';



class GetWorkingHoursParams{
  final int id;
  final IntervalEntity interval;

  GetWorkingHoursParams({required this.id, required this.interval});
}

class GetWorkingHoursUseCase extends UseCase<List<DailyScheduleEntity>, GetWorkingHoursParams> {
  final WorkingHoursRepository repository;

  GetWorkingHoursUseCase(this.repository);

  @override
  Future<Either<Failure, List<DailyScheduleEntity>>> call(GetWorkingHoursParams params) async {
    var employeeId = params.id;
    var interval = params.interval;
    var workingHours = await repository.get(employeeId,interval);
    if(workingHours is Left) {
      return Left(ServerFailure());
    }else{
      var interval = params.interval;
      var dailyScheduleEntity = workingHours.getOrElse(() => []);
      var current = interval.start;
      List<DailyScheduleEntity> entities = [];
      while (current.isBefore(interval.end)) {
        var dailyWorkingHour = dailyScheduleEntity.firstWhereOrNull((element) => element.date.isSameDay(current));
        if(dailyWorkingHour == null){
          entities.add(DailyScheduleEntity(
            date: current,
            start: null,
            end: null,
            branch: null,
            employee: employeeId,
          ));
        }else{
          var dailyWorkingHour =  dailyScheduleEntity.firstWhere((element) => element.date.isSameDay(current));

          entities.add(dailyWorkingHour);
        }
        current = current.add(Duration(days: 1));
      }
      return Right(entities);
    }

  }
}