


import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../core/usecases/use_case.dart';
import '../../../../widgets/cards/root/entity.dart';
import '../repositories/appointment_repository.dart';

class PatchAppointmentParams {
  final DashboardAppointmentEntity appointment;

  PatchAppointmentParams(this.appointment);
}

class PatchAppointmentUseCase extends UseCase<DashboardAppointmentEntity,PatchAppointmentParams> {
  final DashboardAppointmentRepository appointmentRepository;

  PatchAppointmentUseCase(this.appointmentRepository);

  Future<Either<Failure, DashboardAppointmentEntity>> call(PatchAppointmentParams params) async {
    var appointment = params.appointment;
    return await appointmentRepository.patch(appointment);
  }
}