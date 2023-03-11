


import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../widgets/cards/root/entity.dart';

abstract class ViewAppointmentsRepository {

  Future<Either<Failure,List<DashboardAppointmentEntity>>> getPendingAppointments();
  Future<Either<Failure,List<DashboardAppointmentEntity>>> getWaitlistAppointments();
  Future<Either<Failure,List<DashboardAppointmentEntity>>> getCancelledAppointments();
}