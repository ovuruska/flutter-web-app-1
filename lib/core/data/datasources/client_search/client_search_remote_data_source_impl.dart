import 'dart:convert' show jsonDecode;
import 'package:dartz/dartz.dart';

import '../../../../services/auth.dart';
import '../../../domain/entities/client_entity.dart';
import '../../../error/failures.dart';
import 'client_search_remote_data_source.dart';

class ClientSearchRemoteDataSourceImpl extends ClientSearchRemoteDataSource {

  Future<Either<Failure, List<ClientEntity>>> getSearchResults(String query,{
    int page = 1,
  }) async {
    var queryParams = {
      "name__in": query,
      "page": page.toString(),
    };
    var response = await SchedulingAuthService.instance.request(
        "/api/v2/scheduling/customers",
        method: "GET",
        queryParams: queryParams
    );
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    var results = respJson["results"];
    if (response.statusCode == 200) {
      var clients = results.map<ClientEntity>((e) => ClientEntity.fromJson(e)).toList();
      return Right(clients);
    } else {
      return Left(ServerFailure());
    }
  }
}