

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../models/Appointment.dart';

abstract class DogAppointmentsRepository {
  Future<Either<Failure,List<Appointment>>> getPriorAppointments(int petId);

  Future<Either<Failure,List<Appointment>>> getUpcomingAppointments(int petId);

}