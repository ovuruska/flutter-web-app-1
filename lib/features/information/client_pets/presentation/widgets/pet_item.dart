import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../../injection.dart';
import '../../domain/callbacks/select_pet_callback.dart';
import '../../domain/entities/client_pet_item.dart';

class PetItem extends StatelessWidget {
  final ClientPetItem pet;

  const PetItem({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.pets),
      onTap:(){
        try{
          sl<SelectPetCallback>().call(pet);
        }catch(err){

        }
      },
      title: Text(pet.name,
          style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333)))),
      subtitle: Text(pet.breed,
          style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333)))),
    );
  }
}
