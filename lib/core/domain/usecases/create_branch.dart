
import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

import '../entities/branch_entity.dart';
import '../repositories/branch_repository.dart';

class CreateBranchUseCase extends UseCase<BranchEntity, NoParams> {
  final BranchRepository repository;

  CreateBranchUseCase(this.repository);

  @override
  Future<Either<Failure, BranchEntity>> call(NoParams params) async {
    return await repository.create();
  }
}