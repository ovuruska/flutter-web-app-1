import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/branch_id_and_name.dart';
import '../../domain/repositories/branch_repository.dart';

class AppSelectBranchRepositoryImpl extends AppSelectBranchRepository {
  @override
  Future<Either<Failure, List<BranchIdAndName>>> getBranches() async {
    var response =
        await SchedulingAuthService.instance.request("/api/branch/all");
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      List<BranchIdAndName> branches = respJson
          .map<BranchIdAndName>((e) => BranchIdAndName(id: e["id"], name: e["name"]))
          .toList();
      return Right(branches);
    } else {
      return Left(ServerFailure());
    }
  }
}
