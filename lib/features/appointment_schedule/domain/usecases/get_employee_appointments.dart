import 'package:dartz/dartz.dart';

import '../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_case.dart';
import '../repositories/appointment_repository.dart';

class GetEmployeeAppointmentsParams {
  final int id;
  final DateTime start;
  final DateTime end;

  GetEmployeeAppointmentsParams({
    required this.id,
    required this.start,
    required this.end,
  });
}

class GetEmployeeAppointmentsUseCase extends UseCase<List<SchedulingAppointmentEntity>,GetEmployeeAppointmentsParams>
{
  final DashboardAppointmentRepository repository;

  GetEmployeeAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<SchedulingAppointmentEntity>>> call(GetEmployeeAppointmentsParams params) async {
    return await repository.getAppointmentByEmployee(params.id, params.start, params.end);
  }
}