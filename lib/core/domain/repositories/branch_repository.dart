

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_daily_information.dart';

import '../../error/failures.dart';
import '../entities/branch_entity.dart';

abstract class BranchRepository {
  Future<Either<Failure, List<BranchEntity>>> getBranches();

  Future<Either<Failure, BranchDailyInformationEntity>> getDailyInformation(int branchId, DateTime date);
  
  Future<Either<Failure, BranchEntity>> getBranch(int id);

  Future<Either<Failure, BranchEntity>> patch(BranchEntity branch);

  Future<Either<Failure, BranchEntity>> create();

  Future<Either<Failure,void>> remove(int id);


}