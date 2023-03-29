

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

import '../entities/appointment.dart';
import '../repositories/client_repository.dart';

class GetClientPriorAppointmentsParams extends Equatable {
  final int id;

  GetClientPriorAppointmentsParams({required this.id});

  @override
  List<Object> get props => [id];
}


class GetClientPriorAppointmentsUseCase extends UseCase<List<AppointmentEntity>, GetClientPriorAppointmentsParams> {
  final ClientRepository repository;

  GetClientPriorAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<AppointmentEntity>>> call(GetClientPriorAppointmentsParams params) async {
    return await repository.getPriorAppointments(params.id);
  }
}