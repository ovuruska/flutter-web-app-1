


import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/data/datasources/analytics_pet/analytics_pet_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../domain/repositories/analytics_pet_repository.dart';

class AnalyticsPetRepositoryImpl extends AnalyticsPetRepository{
  final AnalyticsPetRemoteDataSource remoteDataSource;

  AnalyticsPetRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, double>> averageServiceTime(int id) async {
    return await remoteDataSource.averageServiceTime(id);
  }

}