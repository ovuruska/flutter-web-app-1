import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../core/use_case.dart';
import '../../../../models/Appointment.dart';
import '../entities/appointment_entity.dart';
import '../repositories/create_appointment_repository.dart';

class CreateAppointmentParams extends Equatable {
  final AppointmentEntity appointment;

  CreateAppointmentParams({
    required this.appointment,
  });

  @override
  List<Object?> get props => [appointment];
}

class CreateAppointmentUseCase
    extends UseCase<Appointment, CreateAppointmentParams> {
  final CreateAppointmentRepository createAppointmentRepository;

  CreateAppointmentUseCase(this.createAppointmentRepository);

  @override
  Future<Either<Failure, Appointment>> call(params) async {
    var appointment = params.appointment;
    return await createAppointmentRepository.create(appointment);
  }
}
