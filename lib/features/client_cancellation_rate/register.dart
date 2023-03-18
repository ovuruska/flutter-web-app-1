

import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/client_cancellation_rate/presentation/bloc/cancellation_rate_bloc.dart';

import 'data/repositories/cancellation_rate_repository_impl.dart';
import 'domain/repositories/cancellation_rate_repository.dart';
import 'domain/usecases/get_cancellation_rate.dart';

registerCancellationRate(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => CancellationRateBloc(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetCancellationRateUseCase(repository:sl()));

  // Repositories
  sl.registerLazySingleton<CancellationRateRepository>(() => CancellationRateRepositoryImpl());
}