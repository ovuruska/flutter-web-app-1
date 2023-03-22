

import 'package:get_it/get_it.dart';

import 'presentation/blocs/branch_select_bloc.dart';

registerBranchSelect(GetIt sl){
  //BLoCs
  sl.registerLazySingleton(() => BranchSelectBloc(sl()));
}