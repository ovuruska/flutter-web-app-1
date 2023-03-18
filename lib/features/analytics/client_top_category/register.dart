import 'package:get_it/get_it.dart';

import 'data/repositories/appointment_type_distribution_repository_impl.dart';
import 'domain/repositories/appointment_type_distribution_repository.dart';
import 'domain/usecases/get_distribution.dart';
import 'presentation/blocs/client_top_category_bloc.dart';

registerClientTopCategory(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientTopCategoryBloc(getDistribution: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetDistributionUseCase( sl()));

  // Repositories
  sl.registerLazySingleton<AppointmentTypeDistributionRepository>(() => AppointmentTypeDistributionRepositoryImpl());
}