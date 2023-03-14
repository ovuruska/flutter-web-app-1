

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_dog_entity.dart';

import '../../../../common/blue_shadow.dart';
import 'pet_item.dart';

class PetsCard extends StatelessWidget {

  final List<ClientDogEntity> dogs;

  const PetsCard({Key? key, required this.dogs}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlueShadow(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 160,
      width:320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text('Pets', style: TextStyle(fontSize: 40, color:const Color(0xFFACACAC)),),
          ),
          Expanded(
            child:ListView(
              scrollDirection: Axis.vertical,
              children: dogs.map<Widget>((e) => PetItem(dog: e,)).toList(),

            )
          )
        ],
      )
    );
  }




}