import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scrubbers_employee_application/features/ticket_information/domain/repositories/ticket_information_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';

class GetConcreteAppointment extends UseCase<Appointment, int> {
  final TicketInformationRepository repository;

  GetConcreteAppointment(this.repository);

  @override
  Future<Either<Failure, Appointment>> call(int appointmentId) async {
    return await repository.fetchAppointment(appointmentId);
  }
}

class Params extends Equatable {
  final int appointmentId;
  Params({required this.appointmentId});

  @override
  List<Object> get props => [appointmentId];
}
