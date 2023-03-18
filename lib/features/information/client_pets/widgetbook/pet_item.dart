import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../../../tables/client_appointments/presentation/widgets/pet_item.dart';
import '../domain/entities/client_pet_item.dart';


@WidgetbookUseCase(name: 'PetItem', type:PetItem)
Widget petItemUseCase(BuildContext context){

  var pet = ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1);
  return PetItem(pet:pet);
}