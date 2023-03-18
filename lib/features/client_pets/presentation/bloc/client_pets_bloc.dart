

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/client_pets/presentation/bloc/client_pets_event.dart';
import 'package:scrubbers_employee_application/features/client_pets/presentation/bloc/client_pets_state.dart';

import '../../domain/usecases/get_client_pets.dart';

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
