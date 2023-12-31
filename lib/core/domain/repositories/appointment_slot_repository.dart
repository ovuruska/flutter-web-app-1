

import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/appointment_slot_entity.dart';
import '../entities/branch_entity.dart';
import '../entities/daily_slot.dart';
import '../entities/employee_entity.dart';

abstract class AppointmentSlotRepository {
  Future<Either<Failure, List<AppointmentSlotEntity>>> getAvailableSlots({
    required DateTime start,
    List<EmployeeEntity> groomers = const [],
    List<BranchEntity> branches = const [],
    required String service,
    required int duration,
  });
  Future<Either<Failure,List<DailySlotEntity>>> getDailySlots({
    required DateTime start,
    List<int> groomers = const [],
    List<int> branches = const [],
    required String service,
  });
}
