import 'package:get_it/get_it.dart';

import 'data/repositories/create_appointment_repository_impl.dart';
import 'data/repositories/get_branches_repository_impl.dart';
import 'data/repositories/get_employees_repository_impl.dart';
import 'domain/repositories/create_appointment_repository.dart';
import 'domain/repositories/get_branches_repository.dart';
import 'domain/repositories/get_employees_repository.dart';
import 'domain/usecases/create_appointment.dart';
import 'domain/usecases/get_branches.dart';
import 'domain/usecases/get_employees.dart';
import 'presentation/bloc/create_appointment_bloc.dart';

registerCreateAppointment(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => CreateAppointmentBloc(
        getBranches: sl(),
        getEmployees: sl(), createAppointment: sl(),
      ));

  // Repositories
  sl.registerLazySingleton<GetBranchesRepository>(
      () => GetBranchesRepositoryImpl());
  sl.registerLazySingleton<GetEmployeesRepository>(
      () => GetAllEmployeesRepositoryImpl());
  sl.registerLazySingleton<CreateAppointmentRepository>(
      () => CreateAppointmentRepositoryImpl());

  // Use cases
  sl.registerLazySingleton(() => GetBranchesUseCase(sl()));
  sl.registerLazySingleton(() => GetEmployeesUseCase(sl()));
  sl.registerLazySingleton(() => CreateAppointmentUseCase(sl()));
}
