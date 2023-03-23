

import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';

import 'package:scrubbers_employee_application/core/domain/entities/appointment_local.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../services/auth.dart';
import 'appointment_remote_data_source.dart';

class AppointmentRemoteDataSourceImpl extends AppointmentRemoteDataSource{
  @override
  Future<Either<Failure, AppointmentEntity>> create(AppointmentEntityLocal appointment) async {
    var response = await SchedulingAuthService.instance.jsonRequest(
      "api/schedule/appointment",
      method: "POST",
      body: appointment.toJson(),
    );


    if (response.statusCode == 201) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      var resultAppointment = AppointmentEntity.fromJson(respJson);
      return Right(resultAppointment);
    } else {
      return Left(ServerFailure());
    }
  }

}