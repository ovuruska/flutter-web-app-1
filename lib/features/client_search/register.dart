import 'package:get_it/get_it.dart';

import 'data/repositories/client_search_impl.dart';
import 'domain/repositories/client_search_repository.dart';
import 'domain/usecases/get_clients.dart';
import 'presentation/bloc/client_search_bloc.dart';

registerClientSearch(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => ClientSearchBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetClientsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ClientSearchRepository>(
      () => ClientSearchRepositoryImpl());
}
