import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../../services/auth.dart';
import '../../domain/entities/appointments_table_data_row_entity.dart';
import '../../domain/entities/paginated_appointments.dart';
import '../../domain/repositories/paginated_appointments_repository.dart';

class PaginatedAppointmentsRepositoryImpl
    extends PaginatedAppointmentsRepository {
  @override
  Future<Either<Failure, PaginatedAppointments>> getLimitOffset(
      String status,
      {DateTime? start,
      DateTime? end,
      int? limit,
      int? offset}) async {
    var formatter = new DateFormat('yyyy-MM-dd');
    var queryParams = {
      'limit': limit?.toString() ?? '20',
      'offset': offset?.toString() ?? '0',
      'status': status,
      'start__gt': (start != null) ? formatter.format(start) : null,
      'start__lt': (end != null) ? formatter.format(end) : null,
    };
    if(queryParams['start__gt'] == null) queryParams.remove('start__gt');
    if(queryParams['start__lt'] == null) queryParams.remove('start__lt');

    var response = await SchedulingAuthService.instance
        .request('/api/v2.1/schedule/appointments', queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    var results = respJson['results'] as List;
    if (response.statusCode != 200) {
      return Left(ServerFailure());
    } else {
      var paginatedAppointments = PaginatedAppointments.fromJson(respJson);
      return Right(paginatedAppointments);

    }
  }

  @override
  Future<Either<Failure, PaginatedAppointments>> getPaginatedAppointments(
      String status,
      {DateTime? start,
      DateTime? end,
      int? page}) async {
    var formatter = new DateFormat('yyyy-MM-dd');

    var queryParams = {
      'page': page?.toString() ?? '1',
      'status': status,
      'start__gt': (start != null) ? formatter.format(start) : null,
      'start__lt': (end != null) ? formatter.format(end) : null,
    };
    if(queryParams['start__gt'] == null) queryParams.remove('start__gt');
    if(queryParams['start__lt'] == null) queryParams.remove('start__lt');

    var response = await SchedulingAuthService.instance
        .request('/api/v2/schedule/appointments', queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);

    if (response.statusCode != 200) {
      return Left(ServerFailure());
    } else {
      var paginatedAppointments = PaginatedAppointments.fromJson(respJson);
      return Right(paginatedAppointments);
    }
  }
}
