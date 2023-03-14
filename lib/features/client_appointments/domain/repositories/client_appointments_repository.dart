
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/CustomerDetails.dart';
import '../entity/appointment_details.dart';

abstract class ClientAppointmentsRepository {
  Future<Either<Failure,List<AppointmentDetails>>> getAppointmentDetails(int customerId);

}