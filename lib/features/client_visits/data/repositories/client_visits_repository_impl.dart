import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../services/auth.dart';
import '../../domain/repositories/client_visits_repository.dart';

class ClientVisitsRepositoryImpl extends ClientVisitsRepository {
  @override
  Future<Either<Failure, Map<String, double>>> get(int id) async {
    var route = "api/analytics/customer/visits/$id";
    var response = await SchedulingAuthService.instance.request(route);
    var respString = await response.stream.bytesToString();
    var respJson = await jsonDecode(respString);
    if (response.statusCode == 200) {
      final Map<String, double> data = {};
      respJson.forEach((key, value) {
        data[key] = value;
      });
      return Right(data);
    } else {
      return Left(ServerFailure());
    }
  }
}
