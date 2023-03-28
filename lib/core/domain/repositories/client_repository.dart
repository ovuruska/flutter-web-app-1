import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/appointment.dart';
import '../entities/client_details.dart';
import '../entities/pet_entity.dart';

abstract class ClientRepository {
  Future<Either<Failure, List<PetEntity>>> getClientPets(int id);

  Future<Either<Failure,ClientDetails>> getClientDetails(int id);

  Future<Either<Failure,List<AppointmentEntity>>> getUpcomingAppointments(int id);

  Future<Either<Failure,List<AppointmentEntity>>> getPriorAppointments(int id);

}