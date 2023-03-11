

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/branch_id_and_name.dart';

abstract class CalendarAndBranchRepository {
  Future<Either<Failure, List<BranchIdAndName>>> getBranches();
}