import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/repositories/no_show_rate_repository.dart';

class NoShowRateRepositoryImpl implements NoShowRateRepository {
  @override
  Future<Either<Failure, double>> getNoShowRate(int id) async {
    var route = "api/analytics/customer/no_show_rate/$id";
    var response = await SchedulingAuthService.instance.request(route);
    var respString = await response.stream.bytesToString();
    var respJson = await jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(respJson["rate"]);
    } else {
      return Left(ServerFailure());
    }
  }

}