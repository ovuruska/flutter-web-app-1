import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/entities/client_pet_item.dart';
import '../../domain/repositories/client_pets_repository.dart';

class ClientPetsRepositoryImpl extends ClientPetsRepository {
  @override
  Future<Either<Failure, List<ClientPetItem>>> getClientPets(int id) async {
    var route = "/api/pets";
    var queryParams = {"owner": id.toString()};
    var response = await SchedulingAuthService.instance
        .request(route, queryParams: queryParams);
    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = await jsonDecode(respString);
      List<ClientPetItem> pets = respJson
          .map<ClientPetItem>((pet) => ClientPetItem.fromJson(pet))
          .toList();
      return Right(pets);
    } else {
      return Left(ServerFailure());
    }
  }
}
