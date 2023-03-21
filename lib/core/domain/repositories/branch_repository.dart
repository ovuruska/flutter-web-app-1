

import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/branch_entity.dart';

abstract class BranchRepository {
  Future<Either<Failure, List<BranchEntity>>> getBranches();
}