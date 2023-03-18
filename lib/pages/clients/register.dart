import 'package:get_it/get_it.dart';

import '../../features/sidebars/client_search/domain/callbacks/select_client_callback.dart';
import 'select_client_callback_impl.dart';

registerClientsView(GetIt sl){
  sl.registerLazySingleton<SelectClientCallback>(() => SelectClientCallbackImpl());
}