import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../domain/repositories/appointment_repository.dart';


class SchedulingAppointmentRepositoryImpl
    extends SchedulingAppointmentRepository {


  @override
  Future<Either<Failure, SchedulingAppointmentEntity>> patch(
      SchedulingAppointmentEntity appointment) async {

    var response = await SchedulingAuthService.instance.jsonRequest(
      "/api/schedule/appointment/${appointment.id}",
      method: "PATCH",
      body: appointment.toJson(),
    );
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(SchedulingAppointmentEntity.fromJson(respJson));
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SchedulingAppointmentEntity>>> getAppointments(DateTime date, int employeeId) async {

    var formatter = new DateFormat('yyyy-MM-dd');
    var startGt = formatter.format(date);
    var startLt = formatter.format(date.add(Duration(days: 1)));


    var queryParams = {
      "start__gt": startGt,
      "start__lt": startLt,
      "employee": employeeId.toString(),
    };

    var response = await SchedulingAuthService.instance.jsonRequest(
      "/api/schedule/appointments",
      method: "GET",
      queryParams: queryParams
    );
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      var appointments = respJson.map<SchedulingAppointmentEntity>((e) => SchedulingAppointmentEntity.fromJson(e)).toList();
      return Right(appointments);
    } else {
      return Left(ServerFailure());
    }
  }

}
