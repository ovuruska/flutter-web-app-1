import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../repositories/appointment_type_distribution_repository.dart';

class GetDistributionParams extends Equatable {
  final int id;

  GetDistributionParams(this.id);

  @override
  List<Object?> get props => [id];
  
}

class GetDistributionUseCase extends UseCase<Map<String,double>,GetDistributionParams>{
  final AppointmentTypeDistributionRepository repository;

  GetDistributionUseCase(this.repository);
  @override
  Future<Either<Failure,Map<String,double>>> call(GetDistributionParams params) async {
    return await repository.getDistribution(params.id);
  }
}