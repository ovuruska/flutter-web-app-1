

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class NoShowRateRepository {
  Future<Either<Failure,double>> getNoShowRate(int id);
}