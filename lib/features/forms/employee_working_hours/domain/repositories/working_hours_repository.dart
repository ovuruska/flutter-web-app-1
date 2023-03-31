import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';

import '../../../../../core/error/failures.dart';
import '../entities/daily_schedule_entity.dart';

abstract class WorkingHoursRepository {
  Future<Either<Failure,void>> upsert(int employeeId,List<DailyScheduleEntity> workingHours);

  Future<Either<Failure,void>> clear(int employeeId,IntervalEntity interval);

  Future<Either<Failure,List<DailyScheduleEntity>>> get(int id,IntervalEntity interval);

}