import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_daily_information.dart';

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

  Future<Either<Failure, BranchDailyInformationEntity>> getDailyInformation(
      int branchId, DateTime date) async {
    return await remoteDataSource.getDailyInformation(branchId, date);
  }

  Future<Either<Failure, BranchEntity>> getBranch(int id) async {
    return await remoteDataSource.getBranch(id);
  }

  Future<Either<Failure, BranchEntity>> patch(BranchEntity branch) async {
    return await remoteDataSource.patch(branch);
  }

  @override
  Future<Either<Failure, BranchEntity>> create() async {
    return await remoteDataSource.create();
  }

  @override
  Future<Either<Failure,void>> remove(int id) async {
    return await remoteDataSource.remove(id);
  }
}
