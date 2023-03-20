

import 'package:get_it/get_it.dart';

import 'presentation/bloc/groomer_select_bloc.dart';

registerGroomerSelect(GetIt sl) {
  sl.registerLazySingleton(() => GroomerSelectBloc(sl()));


}