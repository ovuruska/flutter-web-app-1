import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../services/auth.dart';
import '../../../domain/entities/pet_entity.dart';
import '../../../error/failures.dart';
import 'client_remote_data_source.dart';

class ClientRemoteDataSourceImpl extends ClientRemoteDataSource {
  @override
  Future<Either<Failure, List<PetEntity>>> getClientPets(int id) async {
    var response =
        await SchedulingAuthService.instance.request('/api/scheduling/customer/$id/pets');
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      List<PetEntity> pets = respJson.map<PetEntity>((e) => PetEntity.fromJson(e)).toList();
      return Right(pets);
    } else {
      return Left(ServerFailure());
    }
  }
}
