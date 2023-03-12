

import 'package:get_it/get_it.dart';

import 'data/repositories/appointment_repository_impl.dart';
import 'data/repositories/branch_employees_impl.dart';
import 'domain/repositories/appointment_repository.dart';
import 'domain/repositories/branch_repository.dart';
import 'domain/usecases/get_appointments.dart';
import 'domain/usecases/get_branch_employees.dart';
import 'domain/usecases/patch_appointment.dart';
import 'presentation/bloc/appointment_schedule_bloc.dart';

registerAppointmentSchedule(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => AppointmentScheduleBloc(
      getAppointments: sl(),
      getEmployees: sl(),
      patchAppointment:sl()));

  // Use Cases
  sl.registerLazySingleton(() => PatchAppointmentUseCase(
      sl()));
  sl.registerLazySingleton(() => GetAppointmentsUseCase(
      sl()));
  sl.registerLazySingleton(() => GetBranchEmployeesUseCase(
      sl()));


  // Repositories
  sl.registerLazySingleton<DashboardAppointmentRepository>(() => DashboardAppointmentRepositoryImpl());
  sl.registerLazySingleton<BranchEmployeesRepository>(() => BranchEmployeesRepositoryImpl());
}