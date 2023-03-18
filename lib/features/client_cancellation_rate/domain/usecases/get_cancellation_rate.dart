

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../repositories/cancellation_rate_repository.dart';

class GetCancellationRateParams extends Equatable{
  final int id;

  GetCancellationRateParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class GetCancellationRateUseCase extends UseCase<double,GetCancellationRateParams>{
  final CancellationRateRepository repository;

  GetCancellationRateUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, double>> call(GetCancellationRateParams params) async {
    return await repository.getCancellationRate(params.id);
  }
}