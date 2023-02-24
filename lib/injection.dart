import 'package:get_it/get_it.dart';
import 'package:scrubbers_employee_application/features/search_branches/data/repositories/search_branches_impl.dart';
import 'package:scrubbers_employee_application/features/search_branches/domain/repositories/search_branches.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_bloc.dart';

import 'features/search_branches/domain/usecases/get_branches.dart';

final sl = GetIt.instance;

Future<void> initSl() async{

  // BLoCs
  sl.registerLazySingleton(() => SearchBranchesBloc(getBranches: sl()));

  // Repositories
  sl.registerLazySingleton<SearchBranchesRepository>(() => SearchBranchesRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton(() => GetBranches(sl()));

}