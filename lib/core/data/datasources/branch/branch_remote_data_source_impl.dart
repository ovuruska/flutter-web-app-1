

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch/branch_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../services/auth.dart';

class BranchRemoteDataSourceImpl extends BranchRemoteDataSource {
  @override
  Future<Either<Failure, List<BranchEntity>>> getBranches() async {
    var response = await SchedulingAuthService.instance.request(
      '/api/branch/all',
      method: 'GET'
    );
    if(response.statusCode == 200){
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      List<BranchEntity> branches = respJson.map<BranchEntity>((e) => BranchEntity.fromJson(e)).toList();
      return Right(branches);
    }else{
      return Left(ServerFailure());
    }

  }

}