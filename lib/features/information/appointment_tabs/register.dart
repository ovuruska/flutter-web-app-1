import 'package:get_it/get_it.dart';

import 'data/repositories/view_appointments_impl.dart';
import 'domain/repositories/view_appointments_repository.dart';
import 'domain/use_cases/get_cancelled_appointments.dart';
import 'domain/use_cases/get_pending_appointments.dart';
import 'domain/use_cases/get_waitlist_appointments.dart';
import 'presentation/bloc/view_appointments_bloc.dart';

registerViewAppointments(GetIt sl) {
// BLoCs
  sl.registerLazySingleton(() => ViewAppointmentsBloc(
      getCancelledAppointments: sl(),
      getPendingAppointments: sl(),
      getWaitlistAppointments: sl()));


  // Repositories
  sl.registerLazySingleton<ViewAppointmentsRepository>(
      () => ViewAppointmentsRepositoryImpl());



  // Use cases
  sl.registerLazySingleton(() => GetWaitlistAppointmentsUseCase(sl()));
  sl.registerLazySingleton(() => GetCancelledAppointmentsUseCase(sl()));
  sl.registerLazySingleton(() => GetPendingAppointmentsUseCase(sl()));
}
