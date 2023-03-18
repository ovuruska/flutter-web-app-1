import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_client_information.dart';
import 'client_information_event.dart';
import 'client_information_state.dart';

class ClientInformationBloc extends Bloc<ClientInformationEvent, ClientInformationState> {
  final GetClientInformationUseCase getClientInformation;

  ClientInformationBloc({
    required this.getClientInformation,
  }) : super(ClientInformationInitial()){
    on<GetClientInformationEvent>((event, emit) async {
      emit(ClientInformationLoading());
      GetClientInformationParams params = GetClientInformationParams(id: event.id);
      final result = await getClientInformation(params);
      result.fold((l) => print(l), (r) {
        emit(ClientInformationLoaded(clientInformation: r));

      });
    });
    on<PurgeClientInformationEvent>((event, emit) async {
      emit(ClientInformationInitial());
    });


  }
}