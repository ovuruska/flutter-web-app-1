import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/branch_entity.dart';

abstract class GetBranchesRepository {
  Future<Either<Failure,List<BranchEntity>>> getBranches();
}