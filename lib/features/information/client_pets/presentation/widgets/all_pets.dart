import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/client_pet_item.dart';
import 'pet_item.dart';

class AllPets extends StatelessWidget {
  final List<ClientPetItem> pets;

  const AllPets({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ALL PETS",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 20,
                color: const Color(0xFF71717A),
                fontWeight: FontWeight.w600,
              ),
            )),
        Expanded(
            child:ListView(

              scrollDirection: Axis.vertical,
              children: pets
                  .map<Widget>((e) => PetItem(
                pet: e,
              ))
                  .toList(),
            )
        )

      ],
    );
  }
}
