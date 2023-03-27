

import 'package:get_it/get_it.dart';

import 'data/repositories/no_show_rate_repository_impl.dart';
import 'domain/repositories/no_show_rate_repository.dart';
import 'domain/usecases/get_no_show_rate.dart';
import 'presentation/bloc/no_show_rate_bloc.dart';

registerNoShowRate(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() =>NoShowRateBloc(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetNoShowRateUseCase(repository:sl()));

  // Repositories
  sl.registerLazySingleton<NoShowRateRepository>(() => NoShowRateRepositoryImpl());
}