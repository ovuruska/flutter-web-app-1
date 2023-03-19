import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../core/use_case.dart';
import '../entities/branch_entity.dart';
import '../repositories/get_branches_repository.dart';

class GetBranchesUseCase extends UseCase<List<BranchEntity>, NoParams> {
  final GetBranchesRepository branchRepository;
  GetBranchesUseCase(this.branchRepository);

  @override
  Future<Either<Failure, List<BranchEntity>>> call(params) async {
    return await branchRepository.getBranches();
  }
}
