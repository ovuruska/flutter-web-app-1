import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/Appointment.dart';
import '../../../../repositories/utils.dart';
import '../../../../services/auth.dart';
import '../../domain/repositories/search_branches.dart';

class SearchBranchesRepositoryImpl extends SearchBranchesRepository {

  static listOfBranches(List<dynamic> branches) => branches
      .map((branch) => Branch.fromJson(branch as Map<String, dynamic>))
      .toList();

  @override
  Future<Either<ServerFailure, List<Branch>>> getBranches() async {
    try{
      var response =
      await SchedulingAuthService.instance.request("/api/branch/all");
      var respJson = await response.stream.bytesToString();
      var jsonData = jsonDecode(respJson);
      var result = await listOfBranches(jsonData);
      return Right(result);
    }catch(error){
      return Left(ServerFailure());
    }

  }
}
