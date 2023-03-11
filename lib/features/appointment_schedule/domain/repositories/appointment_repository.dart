

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_appointment_entity.dart';

import '../../../../core/error/failures.dart';

abstract class DashboardAppointmentRepository {

  Future<Either<Failure,List<DashboardAppointmentEntity>>> getAppointmentsByBranch(int branchId,DateTime date);

  Future<Either<Failure,DashboardAppointmentEntity>> patch(DashboardAppointmentEntity);

  Future<Either<Failure,void>> delete(int);

}