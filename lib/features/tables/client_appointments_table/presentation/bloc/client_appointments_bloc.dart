

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_client_appointments.dart';
import 'client_appointments_event.dart';
import 'client_appointments_state.dart';

class ClientAppointmentsBloc extends Bloc<ClientAppointmentsEvent,ClientAppointmentsState>{
  GetClientAppointmentsUseCase getClientAppointments;

  ClientAppointmentsBloc({
    required this.getClientAppointments
}) : super(Initial()){
    on<SetClientEvent>((event, emit) async {
      var client = event.client;
      add(GetClientAppointmentsEvent(client: client.id));
    });

    on<GetClientAppointmentsEvent>((event, emit) async {
      emit(Loading());
      GetClientAppointmentsParams params = GetClientAppointmentsParams(client: event.client);
      final result = await getClientAppointments(params);
      result.fold((l) => print(l), (r) {
        emit(Loaded(appointments: r));
      });
    });


  }


}