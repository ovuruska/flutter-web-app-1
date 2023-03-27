

import 'package:get_it/get_it.dart';

import 'presentation/blocs/available_slots_bloc.dart';

registerAvailableSlots(GetIt sl){
  // BLoCs
  sl.registerLazySingleton(() => AvailableSlotsBloc(sl()));
}