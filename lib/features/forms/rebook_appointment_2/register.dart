

import 'package:get_it/get_it.dart';

import '../client_autocomplete/domain/callbacks/client_autocomplete_client_selected.dart';
import '../client_autocomplete/presentation/bloc/client_autocomplete_bloc.dart';
import '../select_client_pets/presentation/bloc/select_client_pets_bloc.dart';
import 'domain/callbacks/client_autocomplete_client_selected_impl.dart';

registerRebookAppointment2(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientAutocompleteBloc(sl()));
  sl.registerLazySingleton(() => SelectClientPetsBloc(sl()));

  // Repository
  sl.registerLazySingleton<ClientAutocompleteClientSelectedCallback>(() => ClientAutocompleteClientSelectedCallbackImpl());

}