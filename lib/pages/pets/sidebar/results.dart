

import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/pages/pets/sidebar/list_item.dart';

import '../controller.dart';

class PetsSidebarResults extends StatelessWidget{
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(stream: petsBloc.stream, listener: (value){}, builder: (context, value) => _build(context));
  Widget _build(BuildContext context) {
    return SingleChildScrollView(
        child:ListView(
          shrinkWrap: true,
          children: petsBloc.getQueryResults().map((pet) => PetsSidebarListItem(pet:pet,selected: pet.id == petsBloc.value.selectedPet?.id)).toList(),
        )

    );
  }
}