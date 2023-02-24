import 'package:get_it/get_it.dart';

import 'data/repositories/search_branches_impl.dart';
import 'domain/repositories/search_branches.dart';
import 'domain/usecases/get_branches.dart';
import 'presentation/bloc/search_branches_bloc.dart';

register(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => SearchBranchesBloc(getBranches: sl()));

  // Repositories
  sl.registerLazySingleton<SearchBranchesRepository>(() => SearchBranchesRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton(() => GetBranches(sl()));
}