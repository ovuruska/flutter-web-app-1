import 'package:get_it/get_it.dart';

import 'data/repositories/client_pets_repository_impl.dart';
import 'domain/repositories/client_pets_repository.dart';
import 'domain/usecases/get_client_pets.dart';
import 'presentation/bloc/client_pets_bloc.dart';

registerClientPets(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => ClientPetsBloc(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetClientPetsUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientPetsRepository>(
      () => ClientPetsRepositoryImpl());
}
