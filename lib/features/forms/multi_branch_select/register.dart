

import 'package:get_it/get_it.dart';

import 'presentation/blocs/branch_select_bloc.dart';

registerMultiBranchSelect(GetIt sl){
  //BLoCs
  sl.registerLazySingleton(() => MultiBranchSelectBloc(sl()));
}