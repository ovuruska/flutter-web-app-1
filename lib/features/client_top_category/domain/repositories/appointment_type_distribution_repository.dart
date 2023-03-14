import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class AppointmentTypeDistributionRepository {
  Future<Either<Failure,Map<String,double>>> getDistribution(int id);
}