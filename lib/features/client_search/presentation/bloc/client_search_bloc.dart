

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_clients.dart';
import 'client_search_event.dart';
import 'client_search_state.dart';

class ClientSearchBloc extends Bloc<ClientSearchEvent,ClientSearchState>{
  final GetClientsUseCase getClientsUseCase;

  ClientSearchBloc(this.getClientsUseCase) : super(Initial()){
    on<ClientSearchQueryChanged>((event, emit) async {
      if(state is Loading){
        return;
      }
      if(state is Loaded && event.query == (state as Loaded).query){
        return;
      }
      if(state is Loaded && event.query.isEmpty){
        emit(Initial());
        return;
      }
      if(state is Initial) emit(Loading());
      var query = event.query;
      var result = await getClientsUseCase(GetClientsParams(query: query));
      result.fold(
        (failure) => emit(Initial()),
        (clients) {
          var clientsWithDogs = clients.where((client) => client.dogs.length > 0).toList();
          emit(Loaded(query: query, clients: clientsWithDogs));
        }
      );

    });

    on<ClientSearchQueryCleared>((event, emit) {
      emit(Initial());
    });
  }


}