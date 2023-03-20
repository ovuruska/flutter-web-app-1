

import 'package:dartz/dartz.dart';

import '../../domain/entities/client_entity.dart';
import '../../domain/repositories/client_search_repository.dart';
import '../../error/failures.dart';
import '../datasources/client_search/client_search_remote_data_source.dart';

class ClientSearchRepositoryImpl extends ClientSearchRepository {
  final ClientSearchRemoteDataSource remoteDataSource;

  ClientSearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ClientEntity>>> getSearchResults(String query) async {
    return await remoteDataSource.getSearchResults(query);

  }

}