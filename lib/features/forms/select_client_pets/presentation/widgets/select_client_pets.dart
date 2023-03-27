import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

          labelText: (options.length == 0) ? 'No pets found' : 'Select a pet',
          floatingLabelStyle: GoogleFonts.openSans(
            fontSize: 12,
            color: const Color(0xFF2D7CB6),
          ),
          hintText: "Select pet",
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFFDDE2E4)),
            gapPadding: 0,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: options.map((PetEntity pet) {
          return DropdownMenuItem<PetEntity>(
            value: pet,
            child: Text(pet.name),
          );
        }).toList(),
        onChanged:onChanged);
  }
}
