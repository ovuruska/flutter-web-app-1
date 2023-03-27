import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/branch_schedule/appointment_schedule_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';

import 'data/repositories/appointment_repository_impl.dart';
import 'data/repositories/branch_employees_impl.dart';
import 'domain/repositories/appointment_repository.dart';
import 'domain/repositories/branch_repository.dart';
import 'domain/usecases/get_appointments.dart';
import 'domain/usecases/get_branch_employees.dart';
import 'domain/usecases/get_employee_appointments.dart';
import 'domain/usecases/on_drag_create_appointment.dart';
import 'domain/usecases/patch_appointment.dart';
import 'presentation/bloc/employee_schedule/employee_schedule_bloc.dart';

registerAppointmentSchedule(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => AppointmentScheduleBloc(
      createAppointment: sl(),
      getAppointments: sl(),
      getEmployees: sl(),
      patchAppointment: sl()));
  sl.registerLazySingleton(() => ScheduleHeaderDropdownBloc());
  sl.registerLazySingleton(() => EmployeeScheduleBloc(
      createAppointment: sl(), getAppointments: sl(), patchAppointment: sl()));

  // Use Cases
  sl.registerLazySingleton(() => PatchAppointmentUseCase(sl()));
  sl.registerLazySingleton(() => GetAppointmentsUseCase(sl()));
  sl.registerLazySingleton(() => GetBranchEmployeesUseCase(sl()));
  sl.registerLazySingleton(() => GetEmployeeAppointmentsUseCase(sl()));
  sl.registerLazySingleton(() => OnDragCreateAppointmentUseCase(sl()));
  // Repositories
  sl.registerLazySingleton<DashboardAppointmentRepository>(
      () => DashboardAppointmentRepositoryImpl());
  sl.registerLazySingleton<BranchEmployeesRepository>(
      () => BranchEmployeesRepositoryImpl());
}
