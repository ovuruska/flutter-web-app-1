import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/appointments_table_data_row_entity.dart';
import '../entities/paginated_appointments.dart';

abstract class PaginatedAppointmentsRepository {
  Future<Either<Failure, PaginatedAppointments>> getPaginatedAppointments(
      String status,
      {DateTime? start,
      DateTime? end,
      int? page});

  Future<Either<Failure,PaginatedAppointments>> getLimitOffset(
      String status,{
        DateTime? start,
        DateTime? end,
        int? limit,
        int? offset
      });

}
