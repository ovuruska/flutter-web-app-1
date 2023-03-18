import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../../core/usecases/use_case.dart';
import '../entities/paginated_appointments.dart';
import '../repositories/paginated_appointments_repository.dart';

@immutable
class AppointmentsTableGetPendingAppointmentsParams extends Equatable{

  final String status;
  final DateTime? start;
  final DateTime? end;
  final int? page;

  AppointmentsTableGetPendingAppointmentsParams({
    required this.status,
    this.start,
    this.end,
    this.page,
  });

  @override
  List<Object?> get props => [status, start, end];

}

class AppointmentsTableGetPendingAppointmentsUseCase extends UseCase<PaginatedAppointments,AppointmentsTableGetPendingAppointmentsParams>{

  final PaginatedAppointmentsRepository repository;

  AppointmentsTableGetPendingAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, PaginatedAppointments>> call(AppointmentsTableGetPendingAppointmentsParams params) async {
    return await repository.getPaginatedAppointments(params.status,start: params.start,end: params.end,page: params.page);
  }

}