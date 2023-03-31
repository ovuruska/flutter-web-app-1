

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/forms/branch_working_hours/domain/entities/branch_schedule_entity.dart';

abstract class BranchWorkingHoursRepository {
  Future<Either<Failure,void>> upsert(int employeeId,List<BranchScheduleEntity> workingHours);

  Future<Either<Failure,void>> clear(int employeeId,IntervalEntity interval);

  Future<Either<Failure,List<BranchScheduleEntity>>> get(int id,IntervalEntity interval);
}