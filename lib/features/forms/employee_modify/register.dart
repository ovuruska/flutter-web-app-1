import 'package:get_it/get_it.dart';

import 'data/repositories/employee_modify_repository_impl.dart';
import 'domain/repositories/employee_modify_repository.dart';
import 'domain/usecases/delete_employee.dart';
import 'domain/usecases/get_employee.dart';
import 'domain/usecases/patch_employee.dart';
import 'presentation/bloc/employee_modify_bloc.dart';

registerEmployeeModify(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => EmployeeModifyBloc(
        deleteEmployee: sl(),
        patchEmployee: sl(),
        getEmployee: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => DeleteEmployeeUseCase(sl()));
  sl.registerLazySingleton(() => PatchEmployeeUseCase(sl()));
  sl.registerLazySingleton(() => GetEmployeeUseCase(sl()));

  // Repository
  sl.registerLazySingleton<EmployeeModifyRepository>(
      () => EmployeeModifyRepositoryImpl());
}
