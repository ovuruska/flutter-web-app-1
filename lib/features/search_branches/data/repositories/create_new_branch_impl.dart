

import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/Branch.dart';
import '../../domain/repositories/create_new_branch.dart';

class CreateNewBranchRepositoryImpl implements CreateNewBranchRepository {

  CreateNewBranchRepositoryImpl();

  @override
  Future<Either<Failure, Branch>> create() async {
    var response = await SchedulingAuthService.instance.jsonRequest("/api/branch", method:"POST");
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 201) {
      return Right(Branch.fromJson(respJson));
    } else {
      return Left(ServerFailure());
    }

  }

}