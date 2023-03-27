

import 'package:get_it/get_it.dart';

import 'presentation/bloc/groomer_select_bloc.dart';

registerMultiGroomerSelect(GetIt sl) {
  sl.registerLazySingleton(() => MultiGroomerSelectBloc(sl()));


}