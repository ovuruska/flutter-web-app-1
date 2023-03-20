

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/client_repository.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';
import '../entities/pet_entity.dart';

class GetClientPetsParams extends Equatable {
  final int id;

  const GetClientPetsParams({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class GetClientPetsUseCase extends UseCase<List<PetEntity>,GetClientPetsParams>{
  final ClientRepository repository;

  GetClientPetsUseCase(this.repository);

  Future<Either<Failure, List<PetEntity>>> call(GetClientPetsParams params) async {
    return await repository.getClientPets(params.id);
  }

}