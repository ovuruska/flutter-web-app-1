

import 'package:dartz/dartz.dart';

import '../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../core/error/failures.dart';

abstract class DashboardAppointmentRepository {

  Future<Either<Failure,List<SchedulingAppointmentEntity>>> getAppointmentsByBranch(int branchId,DateTime date);

  Future<Either<Failure,SchedulingAppointmentEntity>> patch(SchedulingAppointmentEntity appointment);

  Future<Either<Failure,void>> delete(int appointmentId);

  Future<Either<Failure,List<SchedulingAppointmentEntity>>> getAppointmentByEmployee(int employeeId,DateTime start,DateTime end);

}