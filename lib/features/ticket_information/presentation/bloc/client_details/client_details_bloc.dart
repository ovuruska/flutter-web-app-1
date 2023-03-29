import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_client_details.dart';

import 'client_details_event.dart';
import 'client_details_state.dart';

class TicketInformationClientDetailsBloc extends Bloc<TicketInformationClientDetailsEvent, TicketInformationClientDetailsState> {
  final GetClientDetailsUseCase getClientDetails;
  TicketInformationClientDetailsBloc({required this.getClientDetails})
      : super(TicketInformationClientDetailsStateLoading()){
    on<TicketInformationClientDetailsEventFetch>((event, emit) async {
      var clientId = event.id;
      var params = GetClientDetailsParams(id: clientId);
      var response = await getClientDetails(params);
      response.fold((failure) {
        emit(TicketInformationClientDetailsStateError());
      }, (clientDetails) {
        emit(TicketInformationClientDetailsStateLoaded(clientDetails: clientDetails));
      });
    });
  }
}
