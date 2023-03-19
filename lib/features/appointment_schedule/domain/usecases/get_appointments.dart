import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../../core/use_case.dart';
import '../repositories/appointment_repository.dart';

class GetAppointmentsParams extends Equatable {
  final DateTime date;
  final int branch;

  GetAppointmentsParams({
    required this.date,
    required this.branch,
  });

  @override
  List<Object?> get props => [date, branch];
}

class GetAppointmentsUseCase
    extends UseCase<List<SchedulingAppointmentEntity>, GetAppointmentsParams> {
  final DashboardAppointmentRepository appointmentRepository;

  GetAppointmentsUseCase(this.appointmentRepository);

  @override
  Future<Either<Failure, List<SchedulingAppointmentEntity>>> call(
      GetAppointmentsParams params) async {
    return await appointmentRepository.getAppointmentsByBranch(
        params.branch, params.date);
  }
}
