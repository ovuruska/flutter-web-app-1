

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/client_cancellation_rate/presentation/bloc/cancellation_rate_event.dart';

import '../../domain/usecases/get_cancellation_rate.dart';
import 'cancellation_rate_state.dart';

class CancellationRateBloc extends Bloc<CancellationRateEvent,CancellationRateState>{
  final GetCancellationRateUseCase getCancellationRate;

  CancellationRateBloc(this.getCancellationRate) : super(CancellationRateInitial()){
    on<GetCancellationRateEvent>((event, emit) async {
      emit(CancellationRateLoadingState());
      var params = GetCancellationRateParams(id: event.id);
      var result = await getCancellationRate(params);
      emit(CancellationRateLoaded(cancellationRate: 0.0));
    });
  }

}