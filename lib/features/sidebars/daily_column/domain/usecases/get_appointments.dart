import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../repositories/appointment_repository.dart';

class DailyColumnGetAppointmentsParams extends Equatable {
  final int employee;
  final DateTime date;

  DailyColumnGetAppointmentsParams(
      {required this.employee, required this.date});

  @override
  List<Object?> get props => [employee, date];
}

class DailyColumnGetAppointmentsUseCase
    extends UseCase<List<SchedulingAppointmentEntity>,
        DailyColumnGetAppointmentsParams> {
  final SchedulingAppointmentRepository appointmentRepository;

  DailyColumnGetAppointmentsUseCase(this.appointmentRepository);

  @override
  Future<Either<Failure, List<SchedulingAppointmentEntity>>> call(
      DailyColumnGetAppointmentsParams params) async {
    return await appointmentRepository.getAppointments(
        params.date, params.employee);
  }
}
