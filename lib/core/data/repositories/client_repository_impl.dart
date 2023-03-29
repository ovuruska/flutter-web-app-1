import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client/client_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/core/domain/entities/client_details.dart';

import 'package:scrubbers_employee_application/core/domain/entities/pet_entity.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../domain/repositories/client_repository.dart';

class ClientRepositoryImpl extends ClientRepository {
  final ClientRemoteDataSource remoteDataSource;

  ClientRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<PetEntity>>> getClientPets(int id) async {
    return await remoteDataSource.getClientPets(id);
  }

  @override
  Future<Either<Failure, ClientDetails>> getClientDetails(int id) async {
    return await remoteDataSource.getClientDetails(id);
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getPriorAppointments(
      int id) async {
    return await remoteDataSource.getPriorAppointments(id);
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getUpcomingAppointments(
      int id) async {
    return await remoteDataSource.getUpcomingAppointments(id);
  }
}
