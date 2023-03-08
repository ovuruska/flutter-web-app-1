

import 'package:get_it/get_it.dart';

import 'data/repositories/create_new_employee_impl.dart';
import 'data/repositories/get_all_employees_impl.dart';
import 'data/repositories/patch_employee_impl.dart';
import 'data/repositories/remove_employee_impl.dart';
import 'domain/repositories/create_new_employee.dart';
import 'domain/repositories/get_all_employees.dart';
import 'domain/repositories/patch_employee.dart';
import 'domain/repositories/remove_employee.dart';
import 'domain/usecases/create_new_employee.dart';
import 'domain/usecases/get_employees.dart';
import 'domain/usecases/patch_employee.dart';
import 'domain/usecases/remove_employee.dart';
import 'presentation/bloc/employee_search_bloc.dart';

registerEmployeeSearch(GetIt sl){

  // BLoCs
  sl.registerLazySingleton(() => EmployeeSearchBloc(createNewEmployee: sl(), getEmployees: sl(), patchEmployee: sl(), removeEmployee: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetEmployeesUseCase( sl()));
  sl.registerLazySingleton(() => CreateNewEmployeeUseCase( sl()));
  sl.registerLazySingleton(() => PatchEmployeeUseCase( sl()));
  sl.registerLazySingleton(() => RemoveEmployeeUseCase( sl()));

  // Repository
  sl.registerLazySingleton<CreateNewEmployeeRepository>(() => CreateNewEmployeeRepositoryImpl());
  sl.registerLazySingleton<GetAllEmployeesRepository>(() => GetAllEmployeesRepositoryImpl());
  sl.registerLazySingleton<PatchEmployeeRepository>(() => PatchEmployeeRepositoryImpl());
  sl.registerLazySingleton<RemoveEmployeeRepository>(() => RemoveEmployeeRepositoryImpl());

}