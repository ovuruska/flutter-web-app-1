import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../entities/branch_entity.dart';
import '../repositories/modify_branch_repository.dart';

class SaveBranchParams extends Equatable {
  final BranchEntity branch;

  SaveBranchParams({required this.branch});

  @override
  List<Object> get props => [branch];
}

class SaveBranchUseCase extends UseCase<void, SaveBranchParams> {
  final SaveBranchRepository repository;

  SaveBranchUseCase(this.repository);

  @override
  Future<Either<Failure,void>> call(SaveBranchParams params) async {
    var response = await repository.save(params.branch);
    return Right(response);
  }
}