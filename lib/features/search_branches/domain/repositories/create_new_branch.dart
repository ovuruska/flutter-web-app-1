import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/Branch.dart';

abstract class CreateNewBranchRepository {
  Future<Either<Failure, Branch>> create();
}