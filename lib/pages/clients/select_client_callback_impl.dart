import '../../../../injection.dart';
import '../../features/analytics/client_cancellation_rate/presentation/bloc/cancellation_rate_bloc.dart';
import '../../features/analytics/client_cancellation_rate/presentation/bloc/cancellation_rate_event.dart';
import '../../features/analytics/client_no_show_rate/presentation/bloc/no_show_rate_bloc.dart';
import '../../features/analytics/client_no_show_rate/presentation/bloc/no_show_rate_event.dart';
import '../../features/analytics/client_top_category/presentation/blocs/client_top_category_bloc.dart';
import '../../features/analytics/client_top_category/presentation/blocs/client_top_category_event.dart';
import '../../features/analytics/client_visits/presentation/bloc/client_visits_bloc.dart';
import '../../features/analytics/client_visits/presentation/bloc/client_visits_event.dart';
import '../../features/analytics/client_yearly_appointment/presentation/bloc/client_yearly_appointments_bloc.dart';
import '../../features/analytics/client_yearly_appointment/presentation/bloc/client_yearly_appointments_event.dart';
import '../../features/information/client_information/presentation/bloc/client_information_bloc.dart';
import '../../features/information/client_information/presentation/bloc/client_information_event.dart';
import '../../features/information/client_pets/presentation/bloc/client_pets_bloc.dart';
import '../../features/information/client_pets/presentation/bloc/client_pets_event.dart';
import '../../features/sidebars/client_search/domain/callbacks/select_client_callback.dart';
import '../../features/sidebars/client_search/domain/entities/client_search_entity.dart';
import '../../features/tables/client_appointments_table/presentation/bloc/client_appointments_bloc.dart';
import '../../features/tables/client_appointments_table/presentation/bloc/client_appointments_event.dart';

class SelectClientCallbackImpl implements SelectClientCallback {
  @override
  void call(ClientSearchEntity client) {
    var clientId = client.id;
    sl<ClientAppointmentsBloc>().add(GetClientAppointmentsEvent(client: clientId));
    sl<ClientInformationBloc>().add(GetClientInformationEvent(id: clientId));
    sl<ClientTopCategoryBloc>().add(GetClientTopCategoryDistributionEvent(id: clientId));
    sl<CancellationRateBloc>().add(GetCancellationRateEvent(id: clientId));
    sl<NoShowRateBloc>().add(GetNoShowRateEvent(id: clientId));
    sl<ClientVisitsBloc>().add(GetClientVisitsEvent(id: clientId));
    sl<ClientPetsBloc>().add(GetClientPetsEvent(id: clientId));
    sl<ClientYearlyAppointmentsBloc>().add(GetClientYearlyAppointmentsEvent(id: clientId));
  }
}
