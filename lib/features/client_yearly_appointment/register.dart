
import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/client_yearly_appointment/presentation/bloc/client_yearly_appointments_bloc.dart';

import 'data/repositories/client_yearly_appointment_repository_impl.dart';
import 'domain/repositories/client_yearly_appointment_repository.dart';
import 'domain/usecases/get_client_yearly_appointments.dart';

registerClientYearlyAppointments(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ClientYearlyAppointmentsBloc(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetClientYearlyAppointmentsUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientYearlyAppointmentRepository>(() => ClientYearlyAppointmentRepositoryImpl());

}