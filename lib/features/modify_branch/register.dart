import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/modify_branch/domain/repositories/modify_branch_repository.dart';
import 'package:scrubbers_employee_application/features/modify_branch/domain/usecases/save_branch.dart';
import 'package:scrubbers_employee_application/features/modify_branch/presentation/bloc/modify_branch_bloc.dart';

import 'data/repositories/save_branch_impl.dart';
import 'domain/usecases/set_branch.dart';


registerModifyBranchFeature(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ModifyBranchBloc(modifyBranch: sl(), setBranch: sl()));

  // Repositories

  sl.registerLazySingleton<SaveBranchRepository>(() => SaveBranchRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton(() => SaveBranchUseCase(sl()));
  sl.registerLazySingleton(() => SetBranchUseCase());
}