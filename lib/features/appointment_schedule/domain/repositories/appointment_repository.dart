

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../widgets/cards/root/entity.dart';

abstract class DashboardAppointmentRepository {

  Future<Either<Failure,List<DashboardAppointmentEntity>>> getAppointmentsByBranch(int branchId,DateTime date);

  Future<Either<Failure,DashboardAppointmentEntity>> patch(DashboardAppointmentEntity appointment);

  Future<Either<Failure,void>> delete(int appointmentId);

  Future<Either<Failure,List<DashboardAppointmentEntity>>> getAppointmentByEmployee(int employeeId,DateTime start,DateTime end);

}