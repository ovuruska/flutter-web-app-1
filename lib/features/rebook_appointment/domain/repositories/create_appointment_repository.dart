import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/Appointment.dart';
import '../entities/appointment_entity.dart';

abstract class CreateAppointmentRepository{

  Future<Either<Failure,Appointment>> create(AppointmentEntity appointment);
}