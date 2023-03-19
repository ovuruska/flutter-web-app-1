import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../../../../../models/Branch.dart';
import '../repositories/search_branches.dart';

class GetBranchesUseCase extends UseCase<List<Branch>, NoParams> {
  final SearchBranchesRepository repository;

  GetBranchesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Branch>>> call(NoParams params) async {
    return await repository.getBranches();
  }
}