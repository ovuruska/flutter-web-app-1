

import 'package:get_it/get_it.dart';

import 'presentation/bloc/client_autocomplete_bloc.dart';

registerClientAutocomplete (GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => ClientAutocompleteBloc(sl()));
}