import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../core/use_case.dart';
import '../repositories/appointment_repository.dart';

class DailyColumnPatchAppointmentParams {
  final SchedulingAppointmentEntity appointment;

  DailyColumnPatchAppointmentParams(this.appointment);
}

class DailyColumnPatchAppointmentUseCase extends UseCase<SchedulingAppointmentEntity,DailyColumnPatchAppointmentParams> {
  final SchedulingAppointmentRepository appointmentRepository;

  DailyColumnPatchAppointmentUseCase(this.appointmentRepository);

  Future<Either<Failure, SchedulingAppointmentEntity>> call(DailyColumnPatchAppointmentParams params) async {
    var appointment = params.appointment;
    return await appointmentRepository.patch(appointment);
  }
}