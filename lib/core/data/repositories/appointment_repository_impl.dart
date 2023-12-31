
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/entities/appointment_local.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment/appointment_remote_data_source.dart';

class AppointmentRepositoryImpl extends AppointmentRepository {

  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl(this.remoteDataSource);


  @override
  Future<Either<Failure, AppointmentEntity>> create(
      AppointmentEntityLocal appointment) async {
    return await remoteDataSource.create(appointment);
  }

  @override
  Future<Either<Failure, AppointmentEntity>> get(int id) async {
    return await remoteDataSource.get(id);
  }
}
