

import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/client_search_entity.dart';
import '../../domain/repositories/client_search_repository.dart';

class ClientSearchRepositoryImpl extends ClientSearchRepository {
  @override
  Future<Either<Failure,List<ClientSearchEntity>>> getClientSearchResults(String query) async {
    var queryParams = {
      "search": query,
    };
    var response = await SchedulingAuthService.instance.request("/api/search/customer", queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    var results = respJson["results"];
    if(response.statusCode != 200) {
      return Left(ServerFailure());
    }
    else if(results == null) {
      return Right(<ClientSearchEntity>[]);
    }
    else{
      return Right(results.map<ClientSearchEntity>((e) => ClientSearchEntity.fromJson(e)).toList());
    }


  }



}