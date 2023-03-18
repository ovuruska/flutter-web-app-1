import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../../core/usecases/use_case.dart';
import '../entities/appointments_table_data_row_entity.dart';
import '../entities/paginated_appointments.dart';
import '../repositories/paginated_appointments_repository.dart';

@immutable
class AppointmentsTableGetPendingIntervalParams extends Equatable {
  final String status;
  final DateTime? start;
  final DateTime? end;
  final int? offset;
  final int? limit;

  AppointmentsTableGetPendingIntervalParams(
      {required this.status, this.start, this.end, this.limit, this.offset});

  @override
  List<Object?> get props => [status, start, end, limit, offset];
}

class AppointmentsTableGetPendingIntervalUseCase extends UseCase<
    PaginatedAppointments,
    AppointmentsTableGetPendingIntervalParams> {
  final PaginatedAppointmentsRepository repository;

  AppointmentsTableGetPendingIntervalUseCase(this.repository);

  @override
  Future<Either<Failure, PaginatedAppointments>> call(
      AppointmentsTableGetPendingIntervalParams params) async {
    return await repository.getLimitOffset(params.status,
        start: params.start, end: params.end, offset: params.offset, limit: params.limit);
  }
}
