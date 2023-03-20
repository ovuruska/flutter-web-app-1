import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import 'analytics_pet_remote_data_source.dart';

class AnalyticsPetRemoteDataSourceImpl extends AnalyticsPetRemoteDataSource {
  @override
  Future<Either<Failure, double>> averageServiceTime(int id) async {
    var response = await SchedulingAuthService.instance
        .request('/api/analytics/pet/average_service_time/$id');
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);

    if (response.statusCode == 200) {
      return Right(respJson['average_service_time']);
    } else {
      return Left(ServerFailure());
    }
  }
}
