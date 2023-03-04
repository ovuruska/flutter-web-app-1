import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/get_branches_repository.dart';

class GetBranchesRepositoryImpl implements GetBranchesRepository {
  @override
  Future<Either<Failure, List<BranchEntity>>> getBranches() async {
    var response =
        await SchedulingAuthService.instance.request("/api/branch/all");
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      List<BranchEntity> branches = [];
      for (var branch in respJson) {
        branches.add(BranchEntity.fromJson(branch));
      }
      return Right(branches);
    } else {
      return Left(ServerFailure());
    }
  }
}
