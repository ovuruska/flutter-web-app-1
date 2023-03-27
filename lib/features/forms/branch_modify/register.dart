import 'package:get_it/get_it.dart';

import 'data/repositories/save_branch_impl.dart';
import 'domain/repositories/modify_branch_repository.dart';
import 'domain/usecases/save_branch.dart';
import 'domain/usecases/set_branch.dart';
import 'presentation/bloc/modify_branch_bloc.dart';


registerModifyBranchFeature(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ModifyBranchBloc(modifyBranch: sl(), setBranch: sl()));

  // Repositories

  sl.registerLazySingleton<SaveBranchRepository>(() => SaveBranchRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton(() => SaveBranchUseCase(sl()));
  sl.registerLazySingleton(() => SetBranchUseCase());
}