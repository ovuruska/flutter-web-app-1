import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/client_pets/domain/entities/client_pet_item.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../../client_appointments/presentation/widgets/pet_item.dart';

@WidgetbookUseCase(name: 'PetItem', type:PetItem)
Widget petItemUseCase(BuildContext context){

  var pet = ClientPetItem(name: "Archie", breed: "Spitz Mix - Small", id: 1);
  return PetItem(pet:pet);
}