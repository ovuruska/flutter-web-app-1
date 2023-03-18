import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/client_pet_item.dart';

abstract class ClientPetsRepository {
  Future<Either<Failure,List<ClientPetItem>>> getClientPets(int id);
}