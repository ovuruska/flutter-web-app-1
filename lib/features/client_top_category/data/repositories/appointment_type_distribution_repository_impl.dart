import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/appointment_type_distribution_repository.dart';

class AppointmentTypeDistributionRepositoryImpl
    implements AppointmentTypeDistributionRepository {
  @override
  Future<Either<Failure, Map<String, double>>> getDistribution(int id) async {

    var response = await SchedulingAuthService.instance.request(
      "/api/analytics/customer/invoice_dist/" + id.toString(),
    );
    var respString = await response.stream.bytesToString();
    var respJson = await jsonDecode(respString);
    if(response.statusCode == 200){
      Map<String, double> data = {};
      respJson.forEach((key, value) {
        data[key] = value.toDouble();
      });
      return Right(data);
    }else{
      return Left(ServerFailure());
    }

  }
}
