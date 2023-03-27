import 'package:dartz/dartz.dart';

import '../../../domain/entities/client_entity.dart';
import '../../../error/failures.dart';
import '../../../remote_data_source.dart';

abstract class ClientSearchRemoteDataSource extends RemoteDataSource {

  Future<Either<Failure, List<ClientEntity>>> getSearchResults(String query,{
    int page = 1,
  });
}