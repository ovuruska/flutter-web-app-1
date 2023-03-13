

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/client_search_entity.dart';

abstract class ClientSearchRepository {
  Future<Either<Failure,List<ClientSearchEntity>>> getClientSearchResults(String query);
}