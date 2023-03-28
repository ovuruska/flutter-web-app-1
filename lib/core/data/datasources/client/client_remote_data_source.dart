


import 'package:dartz/dartz.dart';

import '../../../domain/entities/appointment.dart';
import '../../../domain/entities/client_details.dart';
import '../../../domain/entities/pet_entity.dart';
import '../../../error/failures.dart';
import '../../../remote_data_source.dart';

abstract class ClientRemoteDataSource extends RemoteDataSource{
  Future<Either<Failure,List<PetEntity>>> getClientPets(int id);

  Future<Either<Failure,ClientDetails>> getClientDetails(int id);

  Future<Either<Failure,List<AppointmentEntity>>> getUpcomingAppointments(int id);

  Future<Either<Failure,List<AppointmentEntity>>> getPriorAppointments(int id);


}