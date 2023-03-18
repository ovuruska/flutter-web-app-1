

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_client_yearly_appointments.dart';
import 'client_yearly_appointments_event.dart';
import 'client_yearly_appointments_state.dart';

class ClientYearlyAppointmentsBloc extends Bloc<ClientYearlyAppointmentsEvent,ClientYearlyAppointmentsState>{
  final GetClientYearlyAppointmentsUseCase getClientYearlyAppointments;

  ClientYearlyAppointmentsBloc(this.getClientYearlyAppointments) : super(ClientYearlyAppointmentInitial()){
    on<GetClientYearlyAppointmentsEvent>((event, emit) async {
      emit(ClientYearlyAppointmentLoading());
      var params = GetClientYearlyAppointmentsParams(event.id);
      final result = await getClientYearlyAppointments(params);
      result.fold((l) => emit(ClientYearlyAppointmentInitial()), (r) => emit(ClientYearlyAppointmentLoaded(r)));
    });
  }

}