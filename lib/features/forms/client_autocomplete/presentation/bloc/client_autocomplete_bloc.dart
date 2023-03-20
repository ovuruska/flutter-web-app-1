

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/usecases/search_client_name.dart';
import 'client_autocomplete_event.dart';
import 'client_autocomplete_state.dart';

class ClientAutocompleteBloc extends Bloc<ClientAutocompleteEvent,ClientAutocompleteState>{
  final SearchClientNameUseCase search;

  ClientAutocompleteBloc(this.search) : super(ClientAutocompleteState()){
    on<ClientAutocompleteEventCleared>((event, emit) {
      emit(ClientAutocompleteState(options: []));
    });

    on<ClientAutocompleteEventChanged>((event, emit) async {
      var params = SearchClientNameParams(query: event.query);
      var results = await search(params);
      var options = results.getOrElse(() => []);

      emit(ClientAutocompleteState(options: options));
    });
    on<ClientAutocompleteEventSelected>((event, emit) {
      emit(ClientAutocompleteState(options: []));
    });

  }

}