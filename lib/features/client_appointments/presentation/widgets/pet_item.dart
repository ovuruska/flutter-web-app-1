import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/client_pets/domain/entities/client_pet_item.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_dog_entity.dart';

class PetItem extends StatelessWidget {

  final ClientPetItem pet;

  const PetItem({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height:80,
    width:120,
    child:ListTile(
        mouseCursor: SystemMouseCursors.click,
        leading: Icon(Icons.pets,size: 40,color: Colors.black),
    title: Text(pet.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "Poppins",color:Colors.black)),
    subtitle: Text(pet.breed,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Poppins",color:Colors.black)),
    ));
  }

}