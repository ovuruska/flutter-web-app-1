

import 'package:flutter/material.dart';

import '../../domain/entities/client_pet_item.dart';
import 'all_pets.dart';

class ClientPets extends StatelessWidget {
  final List<ClientPetItem> pets;

  const ClientPets({Key? key, required this.pets}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AllPets(pets: pets,)
    );
  }

}