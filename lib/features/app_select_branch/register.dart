import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/data/repositories/app_select_branch_repository_impl.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/repositories/branch_repository.dart';

import 'domain/usecases/get_all_branches.dart';
import 'presentation/bloc/app_select_branch_bloc.dart';

registerAppSelectBranch(GetIt sl) {
  // BLoCs
  sl.registerLazySingleton(() => AppSelectBranchBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllBranchesUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AppSelectBranchRepository>(
      () => AppSelectBranchRepositoryImpl());
}
