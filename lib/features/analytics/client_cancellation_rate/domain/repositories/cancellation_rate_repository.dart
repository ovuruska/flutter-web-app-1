

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';


abstract class CancellationRateRepository {
  Future<Either<Failure,double>> getCancellationRate(int id);
}