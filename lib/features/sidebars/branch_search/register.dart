import 'package:get_it/get_it.dart';


import 'presentation/bloc/search_branches_bloc.dart';

registerSearchBranchesFeature(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => SearchBranchesBloc(createNewBranch:sl(),getBranches: sl(), removeBranch: sl()));


}