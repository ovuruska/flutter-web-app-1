import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import '../domain/entities/client_pet_item.dart';
import '../presentation/widgets/all_pets.dart';
import '../presentation/widgets/pet_item.dart';

@WidgetbookUseCase(name: 'All pets 3 pets', type: PetItem)
Widget allPetsUseCase(BuildContext context) {
  var pets = [
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Tarchie", breed: "Spitz Mix - Small", id: 2),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
  ];
  return AllPets(pets: pets);
}

@WidgetbookUseCase(name: 'All pets 0 pets', type: PetItem)
Widget allPetsUseCase0Pets(BuildContext context) {
  List<ClientPetItem> pets = [];
  return AllPets(pets: pets);
}

@WidgetbookUseCase(name: 'All pets 1 pet', type: PetItem)
Widget allPetsUseCase1Pets(BuildContext context) {
  var pets = [
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
  ];
  return AllPets(pets: pets);
}

@WidgetbookUseCase(name: 'All pets 2 pets', type: PetItem)
Widget allPetsUseCase2Pets(BuildContext context) {
  var pets = [
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Tarchie", breed: "Spitz Mix - Small", id: 2),
  ];
  return AllPets(pets: pets);
}

@WidgetbookUseCase(name: 'All pets 10 pets', type: PetItem)
Widget allPetsUseCase10Pets(BuildContext context) {
  var pets = [
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Tarchie", breed: "Spitz Mix - Small", id: 2),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
    ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1),
  ];
  return AllPets(pets: pets);
}
