

import 'package:dartz/dartz.dart';

import '../../domain/repositories/appointment_slot_repository.dart';
import '../../error/failures.dart';
import '../../domain/entities/appointment_slot_entity.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/entities/employee_entity.dart';
import '../datasources/appointment_slot/appointment_slot_local_data_source.dart';

class AppointmentSlotRepositoryImpl extends AppointmentSlotRepository {

  final AppointmentSlotLocalDataSource localDataSource;

  AppointmentSlotRepositoryImpl(this.localDataSource);

  Future<Either<Failure, List<AppointmentSlotEntity>>> getAvailableSlots({
    required DateTime start,
    List<EmployeeEntity> groomers = const [],
    List<BranchEntity> branches = const [],
    required String service,
    required int duration,
  }) async {
    return await localDataSource.getAvailableSlots(
      start: start,
      groomers: groomers,
      branches: branches,
      service: service,
      duration: duration,
    );
  }
}