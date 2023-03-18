import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../services/auth.dart';
import '../../domain/entity/appointment_details.dart';
import '../../domain/repositories/client_appointments_repository.dart';

class ClientDashboardRepositoryImpl extends ClientAppointmentsRepository {
  @override
  Future<Either<Failure, List<AppointmentDetails>>> getAppointmentDetails(
      int customerId) async {
    var queryParams = {"customer": customerId.toString()};
    var response = await SchedulingAuthService.instance
        .request("/api/schedule/appointments", queryParams: queryParams);
    
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(respJson
          .map<AppointmentDetails>((e) => AppointmentDetails.fromJson(e))
          .toList());
    }
    else {
      return Left(ServerFailure());
    }
  }

}