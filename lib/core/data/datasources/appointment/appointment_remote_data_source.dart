

import 'package:dartz/dartz.dart';

import '../../../domain/entities/appointment.dart';
import '../../../domain/entities/appointment_local.dart';
import '../../../error/failures.dart';

abstract class AppointmentRemoteDataSource{
Future<Either<Failure,AppointmentEntity>> create(
      AppointmentEntityLocal appointment);

Future<Either<Failure,AppointmentEntity>> get(int id);
}