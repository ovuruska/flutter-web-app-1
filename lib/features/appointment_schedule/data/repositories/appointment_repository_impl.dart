import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../widgets/cards/root/entity.dart';
import '../../domain/repositories/appointment_repository.dart';

class DashboardAppointmentRepositoryImpl
    extends DashboardAppointmentRepository {
  @override
  Future<Either<Failure, void>> delete(int) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DashboardAppointmentEntity>> patch(
      DashboardAppointmentEntity appointment) async {

    var response = await SchedulingAuthService.instance.jsonRequest(
      "/api/schedule/appointment/${appointment.id}",
      method: "PATCH",
      body: appointment.toJson(),
    );
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(DashboardAppointmentEntity.fromJson(respJson));
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<DashboardAppointmentEntity>>>
      getAppointmentsByBranch(int branchId, DateTime date) async {
    var formatter = DateFormat('yyyy-MM-dd');
    var formatted = formatter.format(date);
    var nextDay = date.add(Duration(days: 1));
    var nextDayFormatted = formatter.format(nextDay);

    var queryParams = {
      "start__gt": formatted,
      "start__lt": nextDayFormatted,
    };
    var response = await SchedulingAuthService.instance
        .request("/api/schedule/appointments", queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {

      return Right(respJson
          .map<DashboardAppointmentEntity>((e) => DashboardAppointmentEntity.fromJson(e))
          .toList());
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<DashboardAppointmentEntity>>> getAppointmentByEmployee(int employeeId, DateTime start, DateTime end) async {
    var formatter = DateFormat('yyyy-MM-dd');
    var formattedStart = formatter.format(start);
    var formattedEnd = formatter.format(end);
    var queryParams = {
      "employee": employeeId.toString(),
      "start__gt": formattedStart,
      "start__lt": formattedEnd,
    };
    var response = await SchedulingAuthService.instance
        .request("/api/schedule/appointments", queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(respJson
          .map<DashboardAppointmentEntity>((e) => DashboardAppointmentEntity.fromJson(e))
          .toList());
    } else {
      return Left(ServerFailure());
    }
  }
}
