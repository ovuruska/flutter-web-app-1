

import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/tables/appointments_page_table/domain/usecases/get_pending_interval.dart';

import 'data/repositories/paginated_appointments_repository_impl.dart';
import 'domain/repositories/paginated_appointments_repository.dart';
import 'domain/usecases/get_pending_appointments.dart';
import 'presentation/bloc/appointment_data_bloc.dart';
import 'presentation/bloc/appointment_data_notifier.dart';

registerAppointmentsPageTable(GetIt sl) {

  //Repositories
  sl.registerLazySingleton<PaginatedAppointmentsRepository>(() => PaginatedAppointmentsRepositoryImpl());

  // BLoCs
  sl.registerFactory(() => AppointmentDataNotifier(sl()));
  sl.registerLazySingleton(() => AppointmentDataBloc());

  // Use Cases
  sl.registerLazySingleton(() => AppointmentsTableGetPendingAppointmentsUseCase(sl()));
  sl.registerLazySingleton(() => AppointmentsTableGetPendingIntervalUseCase(sl()));

}