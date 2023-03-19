import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../core/use_case.dart';
import '../repositories/appointment_repository.dart';

class PatchAppointmentParams {
  final SchedulingAppointmentEntity appointment;

  PatchAppointmentParams(this.appointment);
}

class PatchAppointmentUseCase extends UseCase<SchedulingAppointmentEntity,PatchAppointmentParams> {
  final DashboardAppointmentRepository appointmentRepository;

  PatchAppointmentUseCase(this.appointmentRepository);

  Future<Either<Failure, SchedulingAppointmentEntity>> call(PatchAppointmentParams params) async {
    var appointment = params.appointment;
    return await appointmentRepository.patch(appointment);
  }
}