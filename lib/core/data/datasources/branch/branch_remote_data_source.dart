

import 'package:dartz/dartz.dart';

import '../../../domain/entities/branch_entity.dart';
import '../../../error/failures.dart';
import '../../../remote_data_source.dart';

abstract class BranchRemoteDataSource extends RemoteDataSource {
  Future<Either<Failure, List<BranchEntity>>> getBranches();
}