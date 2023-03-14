

import 'package:get_it/get_it.dart';

import 'data/repositories/client_information_repository_impl.dart';
import 'domain/repositories/client_information_repository.dart';
import 'domain/usecases/get_client_information.dart';
import 'presentation/bloc/client_information_bloc.dart';

registerClientInformation(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientInformationBloc(getClientInformation: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetClientInformationUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientInformationRepository>(() => ClientInformationRepositoryImpl());
}