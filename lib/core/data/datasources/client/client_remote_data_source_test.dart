import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/domain/entities/pet_entity.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'client_remote_data_source.dart';

final List<PetEntity> defaultPets = [
  PetEntity(
      id: 1,
      name: 'Bobo',
      breed: 'Dogo',
      birth: DateTime(2023),
      weight: 55,
      rabbiesVaccination: DateTime(2023),
      specialHandling: false,
      specialHandlingNotes: '',
      customerNotes: '',
      coatType: 'Doodle'),
  PetEntity(
      id: 2,
      name: 'Bobby',
      breed: 'Dogo',
      birth: DateTime(2023),
      weight: 55,
      rabbiesVaccination: DateTime(2023),
      specialHandling: false,
      specialHandlingNotes: '',
      customerNotes: '',
      coatType: 'Doodle')
];

class ClientRemoteDataSourceTest extends ClientRemoteDataSource {
  List<PetEntity> pets = defaultPets;

  setPets(List<PetEntity> pets) => this.pets = pets;

  @override
  Future<Either<Failure, List<PetEntity>>> getClientPets(int id) {
    return Future.value(Right(pets));
  }
}
