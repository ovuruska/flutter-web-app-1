

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/data/datasources/appointment/appointment_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/appointment_slot/appointment_slot_remote_data_source.dart';

import '../../domain/repositories/appointment_slot_repository.dart';
import '../../error/failures.dart';
import '../../domain/entities/appointment_slot_entity.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/entities/employee_entity.dart';

class AppointmentSlotRepositoryImpl extends AppointmentSlotRepository {

  final AppointmentSlotRemoteDataSource remoteDataSource;


  AppointmentSlotRepositoryImpl(this.remoteDataSource);

  Future<Either<Failure, List<AppointmentSlotEntity>>> getAvailableSlots({
    required DateTime start,
    List<EmployeeEntity> groomers = const [],
    List<BranchEntity> branches = const [],
    required String service,
    required int duration,
  }) async {
    return await remoteDataSource.getAvailableSlots(
      start: start,
      groomers: groomers,
      branches: branches,
      service: service,
      duration: duration,
    );
  }
}