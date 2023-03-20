import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/client_entity.dart';

abstract class ClientSearchRepository{
  Future<Either<Failure,List<ClientEntity>>> getSearchResults(String query);


}