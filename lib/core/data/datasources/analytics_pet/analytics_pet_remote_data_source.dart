


import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../../../remote_data_source.dart';

abstract class AnalyticsPetRemoteDataSource extends RemoteDataSource{
  Future<Either<Failure,double>> averageServiceTime(int id);

}