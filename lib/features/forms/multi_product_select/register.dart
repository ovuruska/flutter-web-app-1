

import 'package:get_it/get_it.dart';

import 'presentation/bloc/product_select_bloc.dart';

registerMultiProductSelect(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => MultiProductSelectBloc(sl()));
}