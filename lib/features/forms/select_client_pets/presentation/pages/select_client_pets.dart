import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/select_client_pets_bloc.dart';
import '../bloc/select_client_pets_event.dart';
import '../bloc/select_client_pets_state.dart';
import '../widgets/select_client_pets.dart';

class SelectClientPetsView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectClientPetsBloc,SelectClientPetsState>(
      bloc:sl<SelectClientPetsBloc>(),
      builder:(context,state){
        var options = state.options;
        return SelectClientPets(
          options: options,
          selected: state.selected,
          onChanged: (value){
            sl<SelectClientPetsBloc>().add(SelectClientPetsEventSelected(selected:value));
          },
        );
      },
    )  ;
  }


}