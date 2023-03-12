import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/calendar_and_branch/data/repositories/branch_repository_impl.dart';
import 'package:scrubbers_employee_application/features/calendar_and_branch/domain/repositories/branch_repository.dart';
import 'package:scrubbers_employee_application/features/calendar_and_branch/domain/usecases/get_all_branches.dart';

import 'presentation/bloc/calendar_and_branch_bloc.dart';

registerCalendarAndBranch(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => CalendarAndBranchBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllBranchesUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<CalendarAndBranchRepository>(
      () => CalendarAndBranchRepositoryImpl());
}
