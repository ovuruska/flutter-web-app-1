import 'package:dartz/dartz.dart';

import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/branch_repository.dart';
import '../../error/failures.dart';
import '../datasources/branch/branch_remote_data_source.dart';

class BranchRepositoryImpl extends BranchRepository {
  final BranchRemoteDataSource remoteDataSource;

  BranchRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BranchEntity>>> getBranches() async {
    return await remoteDataSource.getBranches();
  }
}
