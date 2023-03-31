

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_working_hours.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/core/remote_data_source.dart';
import 'package:scrubbers_employee_application/features/forms/branch_working_hours/domain/entities/branch_schedule_entity.dart';

abstract class BranchWorkingHoursRemoteDataSource extends RemoteDataSource {

  Future<Either<Failure, List<BranchWorkingHours>>> getWeeklySchedule(
      int id, DateTime start, DateTime end);

  Future<Either<Failure, List<BranchWorkingHours>>> setWeek(
      List<BranchWorkingHours> employeeWorkingHours);
}