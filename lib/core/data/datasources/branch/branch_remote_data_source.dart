

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_daily_information.dart';

import '../../../domain/entities/branch_entity.dart';
import '../../../error/failures.dart';
import '../../../remote_data_source.dart';


abstract class BranchRemoteDataSource extends RemoteDataSource {
  Future<Either<Failure, List<BranchEntity>>> getBranches();

  Future<Either<Failure,BranchDailyInformationEntity>> getDailyInformation(int branchId,  DateTime date);
}