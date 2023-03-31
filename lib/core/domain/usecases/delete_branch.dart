

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

import '../../error/failures.dart';
import '../repositories/branch_repository.dart';

class DeleteBranchParams extends Equatable{
  final int id;

  DeleteBranchParams({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteBranchUseCase extends UseCase<void, DeleteBranchParams> {
  final BranchRepository repository;

  DeleteBranchUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteBranchParams params) async {
    return await repository.remove(params.id);
  }
}