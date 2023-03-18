import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/client_pets/domain/repositories/client_pets_repository.dart';
import 'package:scrubbers_employee_application/features/client_pets/presentation/bloc/client_pets_bloc.dart';

import 'data/repositories/client_pets_repository_impl.dart';
import 'domain/usecases/get_client_pets.dart';

registerClientPets(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => ClientPetsBloc(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetClientPetsUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientPetsRepository>(
      () => ClientPetsRepositoryImpl());
}
