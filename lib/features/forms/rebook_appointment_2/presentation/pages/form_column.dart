

import 'package:flutter/material.dart';

import '../../../client_autocomplete/presentation/pages/client_autocomplete.dart';
import '../../../select_client_pets/presentation/pages/select_client_pets.dart';

class FormColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClientAutocompleteView(),
        SelectClientPetsView()
      ],
    );
  }

}