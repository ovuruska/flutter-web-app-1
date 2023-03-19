import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../../core/use_case.dart';
import '../entities/monthly_appointment_costs.dart';
import '../repositories/client_yearly_appointment_repository.dart';

class GetClientYearlyAppointmentsParams extends Equatable{
  final int id;

  GetClientYearlyAppointmentsParams(this.id);

  @override
  List<Object?> get props =>[id];
}

class GetClientYearlyAppointmentsUseCase extends UseCase<Map<String,MonthlyAppointmentCosts>,GetClientYearlyAppointmentsParams>{
  final ClientYearlyAppointmentRepository repository;

  GetClientYearlyAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, MonthlyAppointmentCosts>>> call(GetClientYearlyAppointmentsParams params) async {
    return await repository.getYearlyAppointmentCosts(params.id);
  }

}