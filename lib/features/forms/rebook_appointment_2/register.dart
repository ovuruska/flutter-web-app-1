

import 'package:get_it/get_it.dart';

import '../client_autocomplete/domain/callbacks/client_autocomplete_client_selected.dart';
import '../client_autocomplete/presentation/bloc/client_autocomplete_bloc.dart';
import '../select_client_pets/presentation/bloc/select_client_pets_bloc.dart';
import 'domain/callbacks/client_autocomplete_client_selected_impl.dart';
import 'presentation/bloc/rebook_appointment_2_bloc.dart';

registerRebookAppointment2(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientAutocompleteBloc(sl()));
  sl.registerLazySingleton(() => SelectClientPetsBloc(sl()));
  sl.registerLazySingleton(() => RebookAppointment2Bloc());

  // Repository
  sl.registerLazySingleton<ClientAutocompleteClientSelectedCallback>(() => ClientAutocompleteClientSelectedCallbackImpl());

}