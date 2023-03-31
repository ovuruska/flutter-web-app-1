import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch/branch_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_daily_information.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../../../services/auth.dart';

class BranchRemoteDataSourceImpl extends BranchRemoteDataSource {
  @override
  Future<Either<Failure, List<BranchEntity>>> getBranches() async {
    var response = await SchedulingAuthService.instance
        .request('/api/branch/all', method: 'GET');
    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      List<BranchEntity> branches =
          respJson.map<BranchEntity>((e) => BranchEntity.fromJson(e)).toList();
      return Right(branches);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BranchDailyInformationEntity>> getDailyInformation(
      int branchId, DateTime date) async {
    var formatter = new DateFormat('yyyy-MM-dd');
    var queryParams = {'date': formatter.format(date)};
    var response = await SchedulingAuthService.instance.request(
        '/api/branch/$branchId/daily',
        method: 'GET',
        queryParams: queryParams);
    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      BranchDailyInformationEntity branchDailyInformation =
          BranchDailyInformationEntity.fromJson(respJson);
      return Right(branchDailyInformation);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BranchEntity>> getBranch(int id) async {

    var response = await SchedulingAuthService.instance.request('/api/branch/$id', method: 'GET');
    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      BranchEntity branch = BranchEntity.fromJson(respJson);
      return Right(branch);
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, BranchEntity>> patch(BranchEntity branch) async {
    var response = await SchedulingAuthService.instance.jsonRequest("/api/branch/${branch.id}", method: "PATCH", body: {
      "name": branch.name,
      "address": branch.address,
      "phone": branch.phone,
      "email": branch.email,
      "description": branch.description,
    });

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var branch = BranchEntity.fromJson(jsonDecode(respString));
      return Right(branch);
    }
    else {
      return Left(ServerFailure());
    }



  }

  @override
  Future<Either<Failure, BranchEntity>> create() async {
    var response = await SchedulingAuthService.instance.jsonRequest("/api/branch", method:"POST");
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 201) {
      return Right(BranchEntity.fromJson(respJson));
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure,void>>  remove(int id) async {
    var response = await SchedulingAuthService.instance.request("/api/branch/$id", method: "DELETE");
    if (response.statusCode == 204) {
      return Right(null);
    } else {
      return Left(ServerFailure());
    }
  }
}
