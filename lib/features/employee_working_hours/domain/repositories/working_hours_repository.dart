
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/daily_schedule_entity.dart';
import '../entities/interval_entity.dart';

abstract class WorkingHoursRepository {
  Future<Either<Failure,void>> upsert(int employeeId,List<DailyScheduleEntity> workingHours);

  Future<Either<Failure,void>> clear(int employeeId,IntervalEntity interval);

  Future<Either<Failure,List<DailyScheduleEntity>>> get(int id,IntervalEntity interval);

}