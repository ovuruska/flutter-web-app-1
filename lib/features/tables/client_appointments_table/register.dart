import 'package:get_it/get_it.dart';

import 'data/repositories/client_appointments_repository_impl.dart';
import 'domain/repositories/client_appointments_repository.dart';
import 'domain/usecases/get_client_appointments.dart';
import 'presentation/bloc/client_appointments_bloc.dart';

registerClientAppointments(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientAppointmentsBloc(getClientAppointments: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetClientAppointmentsUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientAppointmentsRepository>(() => ClientDashboardRepositoryImpl());

}