import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/client_pets_bloc.dart';
import '../bloc/client_pets_state.dart';
import '../widgets/client_pets.dart';

class ClientPetsView extends StatelessWidget {
  const ClientPetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientPetsBloc,ClientPetsState>(
      bloc:sl<ClientPetsBloc>(),
      builder: (BuildContext context, state) {
        if(state is ClientPetsLoaded){
          return ClientPets(
            pets: state.pets,
          );
        }else{
          return Container();
        }
      },
    );
  }
}