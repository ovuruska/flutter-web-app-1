import 'package:dartz/dartz.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../core/error/failures.dart';


abstract class ViewAppointmentsRepository {

  Future<Either<Failure,List<SchedulingAppointmentEntity>>> getPendingAppointments();
  Future<Either<Failure,List<SchedulingAppointmentEntity>>> getWaitlistAppointments();
  Future<Either<Failure,List<SchedulingAppointmentEntity>>> getCancelledAppointments();
}