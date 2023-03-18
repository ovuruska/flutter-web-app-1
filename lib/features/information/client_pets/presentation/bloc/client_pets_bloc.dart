import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_client_pets.dart';
import 'client_pets_event.dart';
import 'client_pets_state.dart';

class ClientPetsBloc extends Bloc<ClientPetsEvent,ClientPetsState>{
  final GetClientPetsUseCase getClientPets;

  ClientPetsBloc(this.getClientPets) : super(ClientPetsInitial()){
    on<GetClientPetsEvent>((event, emit) async {
      emit(ClientPetsLoading());
      final result = await getClientPets(GetClientPetsParams(id: event.id));
      result.fold((failure) => emit(ClientPetsInitial()), (pets) => emit(ClientPetsLoaded(pets: pets)));
    });
  }

}
