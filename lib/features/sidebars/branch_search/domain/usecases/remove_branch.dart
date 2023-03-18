import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../repositories/remove_branch.dart';

class RemoveBranchParams extends Equatable {
  final int id;

  RemoveBranchParams({required this.id});

  @override
  List<Object> get props => [id];
}

class RemoveBranchUseCase extends UseCase<void, RemoveBranchParams> {
  final RemoveBranchRepository repository;

  RemoveBranchUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RemoveBranchParams params) async {
    return Right(await repository.remove(params.id));
  }
}