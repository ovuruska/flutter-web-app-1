


import 'package:dartz/dartz.dart';

import '../../../domain/entities/pet_entity.dart';
import '../../../error/failures.dart';
import '../../../remote_data_source.dart';

abstract class ClientRemoteDataSource extends RemoteDataSource{
  Future<Either<Failure,List<PetEntity>>> getClientPets(int id);
}