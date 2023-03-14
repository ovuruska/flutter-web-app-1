


import '../../../../injection.dart';
import '../../features/client_appointments/presentation/bloc/client_appointments_bloc.dart';
import '../../features/client_appointments/presentation/bloc/client_appointments_event.dart';
import '../../features/client_information/presentation/bloc/client_information_bloc.dart';
import '../../features/client_information/presentation/bloc/client_information_event.dart';
import '../../features/client_search/domain/callbacks/select_client_callback.dart';
import '../../features/client_search/domain/entities/client_search_entity.dart';

class SelectClientCallbackImpl implements SelectClientCallback {
  @override
  void call(ClientSearchEntity client) {
    var clientId = client.id;
    sl<ClientAppointmentsBloc>().add(GetClientAppointmentsEvent(client: clientId));
    sl<ClientInformationBloc>().add(GetClientInformationEvent(id: clientId));
  }
}
