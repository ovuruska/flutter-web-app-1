import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../../../../../models/Branch.dart';
import '../repositories/create_new_branch.dart';

class CreateNewBranchUseCase extends UseCase<Branch, NoParams> {
  final CreateNewBranchRepository repository;

  CreateNewBranchUseCase(this.repository);

  @override
  Future<Either<Failure, Branch>> call(NoParams params) async {
    var response = await repository.create();
    return response;
  }
}
