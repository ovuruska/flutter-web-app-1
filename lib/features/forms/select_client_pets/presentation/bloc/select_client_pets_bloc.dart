

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/entities/pet_entity.dart';
import '../../../../../core/domain/usecases/get_client_pets.dart';
import 'select_client_pets_event.dart';
import 'select_client_pets_state.dart';


class SelectClientPetsBloc extends Bloc<SelectClientPetsEvent,SelectClientPetsState>{

  final GetClientPetsUseCase getClientPets;

  SelectClientPetsBloc(this.getClientPets) : super(SelectClientPetsState()){
    on<SelectClientPetsEventSelected>((event, emit) async {
        emit(SelectClientPetsState(options: state.options,selected: event.selected));
    });

    on<SelectClientPetsEventFetchClientPets>((event,emit) async {
      var params = GetClientPetsParams(id: event.id);
        var result = await getClientPets(params);
        List<PetEntity> options = result.fold((l) => [], (r) => r);
        emit(SelectClientPetsState(options: options,selected: state.selected));
    });

    on<SelectClientPetsEventCleared>((event, emit) async {
        emit(SelectClientPetsState(options: [],selected: null));
    });

    on<SelectClientPetsEventOptionsChanged>((event, emit) async {
        emit(SelectClientPetsState(options: event.options,selected: state.selected));
    });
  }

}