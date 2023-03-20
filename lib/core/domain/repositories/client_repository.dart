import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/pet_entity.dart';

abstract class ClientRepository {
  Future<Either<Failure, List<PetEntity>>> getClientPets(int id);
}