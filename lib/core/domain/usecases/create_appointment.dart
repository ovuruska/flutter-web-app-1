import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../../core/use_case.dart';
import '../entities/appointment.dart';
import '../entities/appointment_local.dart';
import '../repositories/appointment_repository.dart';

class CreateAppointmentParams extends Equatable {
  final AppointmentEntityLocal appointment;

  CreateAppointmentParams({
    required this.appointment,
  });

  @override
  List<Object?> get props => [appointment];
}

class CreateAppointmentUseCase
    extends UseCase<AppointmentEntity, CreateAppointmentParams> {
  final AppointmentRepository appointmentRepository;

  CreateAppointmentUseCase(this.appointmentRepository);

  @override
  Future<Either<Failure, AppointmentEntity>> call(params) async {
    var appointment = params.appointment;
    return await appointmentRepository.create(appointment);
  }
}
