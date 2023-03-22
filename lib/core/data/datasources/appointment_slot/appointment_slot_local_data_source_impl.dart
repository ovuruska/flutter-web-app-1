

import 'package:dartz/dartz.dart';

import '../../../domain/entities/appointment_slot_entity.dart';
import '../../../domain/entities/branch_entity.dart';
import '../../../domain/entities/employee_entity.dart';
import '../../../error/failures.dart';
import 'appointment_slot_local_data_source.dart';

class AppointmentSlotLocalDataSourceImpl extends AppointmentSlotLocalDataSource{
  Future<Either<Failure,List<AppointmentSlotEntity>>> getAvailableSlots({
    required DateTime start,
    List<EmployeeEntity> groomers = const [],
    List<BranchEntity> branches = const [],
    required String service,
    required int duration
  }) async {
    var branch = BranchEntity(
      id: 1,
      name: 'Test Branch',
      address: '123 Test St',
      phone: '123-456-7890',
      email: ''
    );
    var employee = EmployeeEntity(
      id: 1,
      name: 'John Doe',
      email: '',
      phone: '123-456-7890', role: 'Full Grooming',
    );

    List<AppointmentSlotEntity> slots = [
      AppointmentSlotEntity(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(minutes: 30)),
        branch: branch,
        employee: employee, service: 'Full Grooming',
      ),
      AppointmentSlotEntity(
        start: DateTime.now().add(Duration(minutes: 30)),
        end: DateTime.now().add(Duration(minutes: 60)),
        branch: branch,
        employee: employee, service: 'Full Grooming',
      ),
      AppointmentSlotEntity(
        start: DateTime.now().add(Duration(minutes: 60)),
        end: DateTime.now().add(Duration(minutes: 90)),
        branch: branch,
        employee: employee, service: 'Full Grooming',
      ),
      AppointmentSlotEntity(
        start: DateTime.now().add(Duration(minutes: 90)),
        end: DateTime.now().add(Duration(minutes: 120)),
        branch: branch,
        employee: employee, service: 'Full Grooming',
      ),
    ];
    return Right(slots);
  }

}