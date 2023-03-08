import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/data/repositories/working_hours_impl.dart';
import 'package:scrubbers_employee_application/features/employee_working_hours/domain/repositories/working_hours_repository.dart';

import 'domain/usecases/clear_working_hours.dart';
import 'domain/usecases/get_working_hours.dart';
import 'domain/usecases/upsert_working_hours.dart';
import 'presentation/bloc/working_hours_bloc.dart';

registerEmployeeWorkingHours(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => EmployeeWorkingHoursBloc(
        upsertWorkingHours: sl(),
        clearWorkingHours: sl(),
        getWorkingHours: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetWorkingHoursUseCase(sl()));
  sl.registerLazySingleton(() => ClearWorkingHoursUseCase(sl()));
  sl.registerLazySingleton(() => UpsertWorkingHoursUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<WorkingHoursRepository>(
      () => WorkingHoursRepositoryImpl());
}
