import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../models/Appointment.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/repositories/create_appointment_repository.dart';

class CreateAppointmentRepositoryImpl extends CreateAppointmentRepository {
  @override
  Future<Either<Failure, Appointment>> create(
      AppointmentEntity appointment) async {
    var response = await SchedulingAuthService.instance.jsonRequest(
      "api/schedule/appointment",
      method: "POST",
      body: appointment.toJson(),
    );

    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    var resultAppointment = Appointment.fromJson(respJson);
    if (response.statusCode == 200) {
      return Right(resultAppointment);
    } else {
      return Left(ServerFailure());
    }
  }
}
