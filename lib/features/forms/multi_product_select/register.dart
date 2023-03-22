

import 'package:get_it/get_it.dart';

import 'presentation/bloc/product_select_bloc.dart';

registerProductSelect(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => ProductSelectBloc(sl()));
}