import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entity/appointment_details.dart';

abstract class ClientAppointmentsRepository {
  Future<Either<Failure,List<AppointmentDetails>>> getAppointmentDetails(int customerId);

}