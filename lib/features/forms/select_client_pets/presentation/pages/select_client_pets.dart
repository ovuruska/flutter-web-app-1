import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/entities/pet_entity.dart';
import '../../../../../injection.dart';
import '../bloc/select_client_pets_bloc.dart';
import '../bloc/select_client_pets_event.dart';
import '../bloc/select_client_pets_state.dart';
import '../widgets/select_client_pets.dart';

class SelectClientPetsView extends StatelessWidget{

  final Function(PetEntity?)? onChanged ;

  const SelectClientPetsView({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectClientPetsBloc,SelectClientPetsState>(
      bloc:sl<SelectClientPetsBloc>(),
      buildWhen: (previous,current) => previous.id != current.id || previous.options != current.options || previous.selected != current.selected,
      builder:(context,state){
        var options = state.options;
        return SelectClientPets(
          key:ValueKey(state.id),
          options: options,
          selected: state.selected,
          onChanged: (value){
            sl<SelectClientPetsBloc>().add(SelectClientPetsEventSelect(selected:value));
            onChanged?.call(value);
          },
        );
      },
    )  ;
  }


}