import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../repositories/no_show_rate_repository.dart';

class GetNoShowRateParams extends Equatable{
  final int id;

  GetNoShowRateParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class GetNoShowRateUseCase extends UseCase<double,GetNoShowRateParams>{
  final NoShowRateRepository repository;

  GetNoShowRateUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, double>> call(GetNoShowRateParams params) async {
    return await repository.getNoShowRate(params.id);
  }
}