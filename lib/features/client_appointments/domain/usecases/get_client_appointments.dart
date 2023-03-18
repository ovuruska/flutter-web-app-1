


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../core/usecases/use_case.dart';
import '../entity/appointment_details.dart';
import '../repositories/client_appointments_repository.dart';

class GetClientAppointmentsParams extends Equatable {
  final int client;

  GetClientAppointmentsParams({required this.client});

  @override
  List<Object> get props => [client];
}

class GetClientAppointmentsUseCase extends UseCase<List<AppointmentDetails>,GetClientAppointmentsParams>{
  final ClientAppointmentsRepository repository;

  GetClientAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<AppointmentDetails>>> call(GetClientAppointmentsParams params) async {
    return await repository.getAppointmentDetails(params.client);

  }

}