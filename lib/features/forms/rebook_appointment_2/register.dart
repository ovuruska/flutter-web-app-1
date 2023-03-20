

import 'package:get_it/get_it.dart';

import 'presentation/bloc/client_autocomplete/client_autocomplete_bloc.dart';

registerRebookAppointment2(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientAutocompleteBloc(sl()));
}