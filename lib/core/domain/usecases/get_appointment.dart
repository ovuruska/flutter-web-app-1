

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/appointment_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

class GetAppointmentParams extends Equatable {
  final int id;

  GetAppointmentParams({required this.id});

  @override
  List<Object> get props => [id];
}

class GetAppointmentUseCase extends UseCase<AppointmentEntity, GetAppointmentParams> {
  final AppointmentRepository repository;

  GetAppointmentUseCase(this.repository);

  @override
  Future<Either<Failure, AppointmentEntity>> call(
      GetAppointmentParams params) async {
    return await repository.get(params.id);
  }
}