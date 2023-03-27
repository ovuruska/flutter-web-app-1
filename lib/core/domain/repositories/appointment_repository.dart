

import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/appointment.dart';
import '../entities/appointment_local.dart';

abstract class AppointmentRepository {
  Future<Either<Failure,AppointmentEntity>> create(AppointmentEntityLocal appointment);

}