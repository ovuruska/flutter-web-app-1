import 'package:dartz/dartz.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../repositories/view_appointments_repository.dart';

class GetPendingAppointmentsUseCase extends UseCase<List<SchedulingAppointmentEntity>, NoParams> {
  final ViewAppointmentsRepository repository;

  GetPendingAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<SchedulingAppointmentEntity>>> call(NoParams params) async {
    return await repository.getPendingAppointments();
  }
}