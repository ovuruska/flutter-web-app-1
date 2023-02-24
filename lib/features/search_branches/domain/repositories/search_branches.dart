import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../models/Branch.dart';
import 'package:dartz/dartz.dart';

abstract class SearchBranchesRepository {
  Future<Either<ServerFailure,List<Branch>>> getBranches();
}