import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/Appointment.dart';
import '../../../../repositories/utils.dart';
import '../../../../services/auth.dart';
import '../../domain/repositories/dog_appointments_repository.dart';

class DogAppointmentsRepositoryImpl extends DogAppointmentsRepository {
  @override
  Future<Either<Failure, List<Appointment>>> getPriorAppointments(
      int petId) async {
    var dateNow = DateTime.now();

    var queryParams = {
      "start__lt":
          DateFormat("yyyy-MM-dd").format(dateNow.subtract(Duration(days: 1))),
      "dog": petId.toString(),
      "status": "Completed"
    };

    var response = await SchedulingAuthService.instance
        .request("/api/schedule/appointments", queryParams: queryParams);

    var result = await listOfAppointments(response);
    if (result == null) {
      return Left(ServerFailure());
    } else {
      return Right(result);
    }
  }

  @override
  Future<Either<Failure, List<Appointment>>> getUpcomingAppointments(
      int petId) async {
    var dateNow = DateTime.now();

    var queryParams = {
      "start__gt":
          DateFormat("yyyy-MM-dd").format(dateNow.add(Duration(days: 1))),
      "dog": petId.toString(),
    };

    var response = await SchedulingAuthService.instance
        .request("/api/schedule/appointments", queryParams: queryParams);

    var result = await listOfAppointments(response);
    if (result == null) {
      return Left(ServerFailure());
    } else {
      return Right(result);
    }
  }
}
