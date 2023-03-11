import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_appointment_entity.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/repositories/appointment_repository.dart';

class DashboardAppointmentRepositoryImpl
    extends DashboardAppointmentRepository {
  @override
  Future<Either<Failure, void>> delete(int) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DashboardAppointmentEntity>> patch(
      DashboardAppointmentEntity) {
    throw UnimplementedError();
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
      "branch": branchId.toString(),
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
