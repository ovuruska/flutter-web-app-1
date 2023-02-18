import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/pets/controller.dart';

import 'wrappers.dart';

class PetsMainInformationRowPetInformationLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: petsBloc.stream,
      listener: (value) {},
      builder: (context, snapshot) => _build(context));

  Widget _build(BuildContext context) {
    var selectedPet = petsBloc.value.selectedPet;
    var petId = selectedPet?.id ?? "N/A";
    var petName = selectedPet?.name ?? "N/A";
    var petBreed = selectedPet?.breed ?? "N/A";
    var petWeight = selectedPet?.weight.toString() ?? "N/A";
    var petAge = selectedPet?.age.toString() ?? "N/A";

    return Container(
        child: Row(children: [
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        boldText("Pet Id"),
        boldText("Pet Name"),
        boldText("Pet Breed"),
        boldText("Pet Weight"),
        boldText("Pet Age"),
      ]),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        infoText(petId.toString()),
        infoText(petName),
        infoText(petBreed),
        infoText(petWeight),
        infoText(petAge),
      ]),
    ]));
  }
}
