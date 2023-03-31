

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/branch_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';
import '../entities/branch_entity.dart';

class PatchBranchParams extends Equatable{
  final BranchEntity branch;

  PatchBranchParams({required this.branch});

  @override
  List<Object> get props => [branch];
}


class PatchBranchUseCase extends UseCase<BranchEntity,PatchBranchParams>{
  final BranchRepository repository;

  PatchBranchUseCase(this.repository);

  @override
  Future<Either<Failure, BranchEntity>> call(PatchBranchParams params) {
    return repository.patch(params.branch);
  }

}