import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/pet_entity.dart';

class SelectClientPets extends StatelessWidget {
  final List<PetEntity> options;
  final PetEntity? selected;
  final Function(PetEntity?)? onChanged ;

  const SelectClientPets({Key? key, required this.options, this.selected, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<PetEntity>(
        value: selected,
        decoration: InputDecoration(
          labelText: 'Pet',
          border: OutlineInputBorder(),
        ),
        items: options.map((PetEntity pet) {
          return DropdownMenuItem<PetEntity>(
            value: pet,
            child: Text(pet.name),
          );
        }).toList(),
        onChanged:(val){});
  }
}
