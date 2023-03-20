import 'package:dartz/dartz.dart';

import '../../error/failures.dart';

abstract class AnalyticsPetRepository{
  Future<Either<Failure,double>> averageServiceTime(int id);
}