import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scrubbers_employee_application/features/dog_appointments/domain/repositories/dog_appointments_repository.dart';
import 'package:scrubbers_employee_application/features/ticket_information/domain/repositories/ticket_information_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';

class GetPriorAppointments extends UseCase<List<Appointment>, int> {
  final DogAppointmentsRepository repository;

  GetPriorAppointments(this.repository);

  @override
  Future<Either<Failure, List<Appointment>>> call(int petId) async {
    return await repository.getPriorAppointments(petId);
  }
}

class Params extends Equatable {
  final int appointmentId;
  Params({required this.appointmentId});

  @override
  List<Object> get props => [appointmentId];
}
