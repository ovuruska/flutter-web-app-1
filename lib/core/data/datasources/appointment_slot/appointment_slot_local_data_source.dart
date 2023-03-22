

import 'package:dartz/dartz.dart';

import '../../../domain/entities/appointment_slot_entity.dart';
import '../../../domain/entities/branch_entity.dart';
import '../../../domain/entities/employee_entity.dart';
import '../../../error/failures.dart';

abstract class AppointmentSlotLocalDataSource{
Future<Either<Failure,List<AppointmentSlotEntity>>> getAvailableSlots({
    required DateTime start,
    List<EmployeeEntity> groomers = const [],
    List<BranchEntity> branches = const [],
    required String service,
    required int duration
  });

}