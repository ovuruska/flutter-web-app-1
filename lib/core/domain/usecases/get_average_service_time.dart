
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/analytics_pet_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';

class GetAverageServiceTimeParams extends Equatable {
  final int id;
  const GetAverageServiceTimeParams({required this.id});

  @override
  List<Object> get props => [id];
}


class GetAverageServiceTimeUseCase extends UseCase<double,GetAverageServiceTimeParams>{

  final AnalyticsPetRepository repository;

  GetAverageServiceTimeUseCase(this.repository);

  @override
  Future<Either<Failure, double>> call(GetAverageServiceTimeParams params) async {
    return await repository.averageServiceTime(params.id);
  }


}