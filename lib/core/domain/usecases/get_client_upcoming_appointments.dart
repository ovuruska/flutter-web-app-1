

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

import '../entities/appointment.dart';
import '../repositories/client_repository.dart';

class GetClientUpcomingAppointmentsParams extends Equatable {
  final int id;

  GetClientUpcomingAppointmentsParams({required this.id});

  @override
  List<Object> get props => [id];
}


class GetClientUpcomingAppointmentsUseCase extends UseCase<List<AppointmentEntity>, GetClientUpcomingAppointmentsParams> {
  final ClientRepository repository;

  GetClientUpcomingAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<AppointmentEntity>>> call(GetClientUpcomingAppointmentsParams params) async {
    return await repository.getUpcomingAppointments(params.id);
  }
}