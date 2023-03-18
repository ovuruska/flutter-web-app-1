

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_client_visits.dart';
import 'client_visits_event.dart';
import 'client_visits_state.dart';

class ClientVisitsBloc extends Bloc<ClientVisitsEvent,ClientVisitsState>{
  final GetClientVisitsUseCase getClientVisits;

  ClientVisitsBloc(this.getClientVisits) : super(ClientVisitsInitial()){
    on<GetClientVisitsEvent>((event, emit) async {
      emit(ClientVisitsLoading());
      final result = await getClientVisits(event.id);
      result.fold((failure) => emit(ClientVisitsInitial()), (data) => emit(ClientVisitsLoaded(data:data)));
    });
  }

}