import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_dog_entity.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import '../widgets/pets_card.dart';

@WidgetbookUseCase(type: PetsCard, name: 'Pets Card no item')
Widget petsCardUseCase(BuildContext context) {
  return PetsCard(
    dogs: [],
  );
}

@WidgetbookUseCase(type: PetsCard, name: 'Pets Card 1 item')
Widget petsCardUseCaseOneItem(BuildContext context) {
  return PetsCard(
    dogs: [ClientDogEntity(id: 0, name: "Archie", breed: "Cockier Spaniel")],
  );
}

@WidgetbookUseCase(type: PetsCard, name: 'Pets Card 2 item')
Widget petsCardUseCaseTwoItem(BuildContext context) {
  return PetsCard(
    dogs: [
      // 2 items
      ClientDogEntity(id: 0, name: "Archie", breed: "Cockier Spaniel"),
      ClientDogEntity(id: 1, name: "Bella", breed: "Cockier Spaniel")
    ],
  );
}

@WidgetbookUseCase(type: PetsCard, name: 'Pets Card 10 item')
Widget petsCardUseCaseTenItem(BuildContext context) {
  return PetsCard(dogs: [
    ClientDogEntity(id: 0, name: "Archie", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 1, name: "Bella", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 2, name: "Bela", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 3, name: "Ella", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 4, name: "Ela", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 5, name: "Bel", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 6, name: "Bea", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 7, name: "Bae", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 8, name: "Bra", breed: "Cockier Spaniel"),
    ClientDogEntity(id: 9, name: "Bro", breed: "Cockier Spaniel"),
  ]);
}
