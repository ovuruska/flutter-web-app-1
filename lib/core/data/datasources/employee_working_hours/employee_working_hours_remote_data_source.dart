import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/remote_data_source.dart';

import '../../../domain/entities/employee_working_hours.dart';
import '../../../error/failures.dart';

abstract class EmployeeWorkingHoursRemoteDataSource extends RemoteDataSource {
  Future<Either<Failure, List<EmployeeWorkingHours>>> getWeeklySchedule(
      int id, DateTime start, DateTime end);

  Future<Either<Failure, List<EmployeeWorkingHours>>> setWeek(
      List<EmployeeWorkingHours> employeeWorkingHours);
}
