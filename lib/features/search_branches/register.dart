import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/search_branches/data/repositories/create_new_branch_impl.dart';
import 'package:scrubbers_employee_application/features/search_branches/domain/repositories/remove_branch.dart';

import 'data/repositories/remove_branch_impl.dart';
import 'data/repositories/search_branches_impl.dart';
import 'domain/repositories/create_new_branch.dart';
import 'domain/repositories/search_branches.dart';
import 'domain/usecases/create_new_branch.dart';
import 'domain/usecases/get_branches.dart';
import 'domain/usecases/remove_branch.dart';
import 'presentation/bloc/search_branches_bloc.dart';

registerSearchBranchesFeature(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => SearchBranchesBloc(createNewBranch:sl(),getBranches: sl(), removeBranch: sl()));

  // Repositories
  sl.registerLazySingleton<SearchBranchesRepository>(() => SearchBranchesRepositoryImpl());
  sl.registerLazySingleton<CreateNewBranchRepository>(() => CreateNewBranchRepositoryImpl());
  sl.registerLazySingleton<RemoveBranchRepository>(() => RemoveBranchRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton(() => GetBranchesUseCase(sl()));
  sl.registerLazySingleton(() => CreateNewBranchUseCase(sl()));
  sl.registerLazySingleton(() => RemoveBranchUseCase(sl()));
}