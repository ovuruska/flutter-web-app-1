

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';
import '../entities/branch_entity.dart';
import '../repositories/branch_repository.dart';

class GetAllBranchesUseCase extends UseCase<List<BranchEntity>,NoParams>{

  final BranchRepository repository;

  GetAllBranchesUseCase(this.repository);

  @override
  Future<Either<Failure, List<BranchEntity>>> call(NoParams params) async {
    return await repository.getBranches();
  }

}