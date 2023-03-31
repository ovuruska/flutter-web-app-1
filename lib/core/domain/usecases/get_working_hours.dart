import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/branch_working_hours_repository.dart';

import '../../error/failures.dart';
import '../../use_case.dart';
import '../../../features/forms/branch_working_hours/domain/entities/branch_schedule_entity.dart';
import 'package:collection/collection.dart';



class GetWorkingHoursParams{
  final int id;
  final IntervalEntity interval;

  GetWorkingHoursParams({required this.id, required this.interval});
}

class GetWorkingHoursUseCase extends UseCase<List<BranchScheduleEntity>, GetWorkingHoursParams> {
  final BranchWorkingHoursRepository repository;

  GetWorkingHoursUseCase(this.repository);

  @override
  Future<Either<Failure, List<BranchScheduleEntity>>> call(GetWorkingHoursParams params) async {
    var employeeId = params.id;
    var interval = params.interval;
    var workingHours = await repository.get(employeeId,interval);
    if(workingHours is Left) {
      return Left(ServerFailure());
    }else{
      var interval = params.interval;
      var dailyScheduleEntity = workingHours.getOrElse(() => []);
      var current = interval.start;
      List<BranchScheduleEntity> entities = [];
      while (current.isBefore(interval.end)) {
        var dailyWorkingHour = dailyScheduleEntity.firstWhereOrNull((element) => element.date.isSameDay(current));
        if(dailyWorkingHour == null){
          entities.add(BranchScheduleEntity(
            date: current,
            start: null,
            end: null,
            branch: null,
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