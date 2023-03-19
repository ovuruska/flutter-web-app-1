

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';

import '../../../../../core/error/failures.dart';


abstract class  SchedulingAppointmentRepository {

  Future<Either<Failure,SchedulingAppointmentEntity>> patch(SchedulingAppointmentEntity appointment);

  Future<Either<Failure,void>> delete(int appointmentId);

  Future<Either<Failure,List<SchedulingAppointmentEntity>>> getAppointments(DateTime date, int employeeId);

}