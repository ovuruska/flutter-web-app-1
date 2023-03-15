
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/monthly_appointment_costs.dart';

abstract class ClientYearlyAppointmentRepository{

  Future<Either<Failure,Map<String,MonthlyAppointmentCosts>>> getYearlyAppointmentCosts(int id);
}