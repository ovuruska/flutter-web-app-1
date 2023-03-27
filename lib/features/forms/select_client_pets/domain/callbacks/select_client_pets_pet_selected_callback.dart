

import '../../../../../core/domain/entities/pet_entity.dart';

abstract class SelectClientPetsSelectedCallback {
  void call(PetEntity pet);
}