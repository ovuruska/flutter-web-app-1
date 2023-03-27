import 'package:get_it/get_it.dart';

import 'data/repositories/client_visits_repository_impl.dart';
import 'domain/repositories/client_visits_repository.dart';
import 'domain/usecases/get_client_visits.dart';
import 'presentation/bloc/client_visits_bloc.dart';

registerClientVisits(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientVisitsBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetClientVisitsUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientVisitsRepository>(() => ClientVisitsRepositoryImpl());

}