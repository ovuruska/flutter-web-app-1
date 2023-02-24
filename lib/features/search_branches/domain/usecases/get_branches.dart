

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../../../../models/Branch.dart';
import '../repositories/search_branches.dart';

class GetBranches extends UseCase<List<Branch>, NoParams> {
  final SearchBranchesRepository repository;

  GetBranches(this.repository);

  @override
  Future<Either<Failure, List<Branch>>> call(NoParams params) async {
    return await repository.getBranches();
  }
}