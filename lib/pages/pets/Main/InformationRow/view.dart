import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/pages/pets/Main/InformationRow/PetInformationLeft.dart';

import 'ClientInformation.dart';
import 'PetInformationRight.dart';

class PetsMainInformationRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          PetsMainInformationRowPetInformationLeft(),
          PetsMainInformationRowPetInformationRight(),
          PetsMainInformationRowClientInformation(),
        ]));
  }
}
