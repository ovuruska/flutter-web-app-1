import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/creatable_scheduling_appointment_entity.dart';

import '../../../../../core/use_case.dart';
import '../../../../core/domain/entities/appointment.dart';
import '../../../../core/domain/entities/appointment_local.dart';
import '../../../../core/domain/repositories/appointment_repository.dart';

/*

DO NOT MIGRATE THIS USE CASE
IT IS A CONTEXT-DEPENDENT USE CASE


 */


class OnDragCreateAppointmentParams extends Equatable {
  final CreatableSchedulingAppointmentEntity appointment;

  OnDragCreateAppointmentParams({
    required this.appointment,
  });

  @override
  List<Object?> get props => [appointment];
}

class OnDragCreateAppointmentUseCase
    extends UseCase<AppointmentEntity, OnDragCreateAppointmentParams> {
  final AppointmentRepository appointmentRepository;

  OnDragCreateAppointmentUseCase(this.appointmentRepository);

  @override
  Future<Either<Failure, AppointmentEntity>> call(params) async {
    var appointment = params.appointment;
    var appointmentEntityLocal = AppointmentEntityLocal(
      customer: appointment.customerId,
      employee: appointment.employee,
      service: appointment.service, pet: appointment.dogId, start: appointment.start, end: appointment.end, branch: appointment.branch, products: appointment.products

    );

    return await appointmentRepository.create(appointmentEntityLocal);
  }
}
