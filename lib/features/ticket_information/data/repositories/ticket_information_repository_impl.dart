

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/ticket_information/domain/entities/client_information.dart';
import 'package:scrubbers_employee_application/features/ticket_information/domain/entities/pet_information.dart';
import 'package:scrubbers_employee_application/features/ticket_information/domain/repositories/ticket_information_repository.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

class TicketInformationRepositoryImpl extends TicketInformationRepository{
  @override
  Future<Either<Failure, Appointment>> fetchAppointment(int appointmentId) async {
    var appointment = await AppointmentRepository.instance.fetchAppointment(appointmentId);
    if(appointment != null){
      return Right(appointment);
    }else{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ClientInformation>> getClientInformation() {
    // TODO: implement getClientInformation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PetInformation>> getPetInformation() {
    // TODO: implement getPetInformation
    throw UnimplementedError();
  }

}