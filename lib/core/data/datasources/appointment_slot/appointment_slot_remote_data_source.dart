


import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';

import '../../../domain/entities/appointment_slot_entity.dart';
import '../../../domain/entities/branch_entity.dart';
import '../../../error/failures.dart';
import '../../../remote_data_source.dart';
import '../../../domain/entities/employee_entity.dart';

abstract class AppointmentSlotRemoteDataSource extends RemoteDataSource{

  Future<Either<Failure,List<AppointmentSlotEntity>>> getAvailableSlots({
    required DateTime start,
    List<EmployeeEntity> groomers = const [],
    List<BranchEntity> branches = const [],
    required String service,
    required int duration
});

  Future<Either<Failure,List<DailySlotEntity>>> getDailySlots({
    required DateTime start,
    List<EmployeeEntity> groomers = const [],
    List<BranchEntity> branches = const [],
    required String service,
});

}