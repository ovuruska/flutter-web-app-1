import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../common/scheduling/models/scheduling_appointment_entity.dart';


abstract class  SchedulingAppointmentRepository {

  Future<Either<Failure,SchedulingAppointmentEntity>> patch(SchedulingAppointmentEntity appointment);

  Future<Either<Failure,List<SchedulingAppointmentEntity>>> getAppointments(DateTime date, int employeeId);

}