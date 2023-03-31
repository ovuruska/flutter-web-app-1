

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../error/failures.dart';
import '../../use_case.dart';
import '../entities/branch_entity.dart';
import '../repositories/branch_repository.dart';

class GetBranchParams extends Equatable {
  final int id;

  GetBranchParams({required this.id});

  @override
  List<Object> get props => [id];
}

class GetBranchUseCase extends UseCase<BranchEntity, GetBranchParams> {
  final BranchRepository repository;

  GetBranchUseCase(this.repository);

  @override
  Future<Either<Failure, BranchEntity>> call(GetBranchParams params) async {
    return await repository.getBranch(params.id);
  }
}