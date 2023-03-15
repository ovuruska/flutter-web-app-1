

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/features/client_pets/domain/entities/client_pet_item.dart';

import '../../../../core/usecases/use_case.dart';
import '../repositories/client_pets_repository.dart';

class GetClientPetsParams extends Equatable {
  final int id;
  GetClientPetsParams({required this.id});

  @override
  List<Object?> get props => [id];

}

class GetClientPetsUseCase extends UseCase<List<ClientPetItem>,GetClientPetsParams>{

  final ClientPetsRepository repository;

  GetClientPetsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ClientPetItem>>> call(GetClientPetsParams params) async {
    return await repository.getClientPets(params.id);
  }

}