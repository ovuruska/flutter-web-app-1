import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/ticket_information/domain/entities/client_information.dart';
import 'package:scrubbers_employee_application/features/ticket_information/domain/entities/pet_information.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';


abstract class TicketInformationRepository {
  Future<Either<Failure, PetInformation>> getPetInformation();

  Future<Either<Failure,ClientInformation>> getClientInformation();

  Future<Either<Failure, Appointment>> fetchAppointment(int appointmentId);

}