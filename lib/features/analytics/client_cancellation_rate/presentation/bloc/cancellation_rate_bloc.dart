import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_cancellation_rate.dart';
import 'cancellation_rate_event.dart';
import 'cancellation_rate_state.dart';

class CancellationRateBloc extends Bloc<CancellationRateEvent,CancellationRateState>{
  final GetCancellationRateUseCase getCancellationRate;

  CancellationRateBloc(this.getCancellationRate) : super(CancellationRateInitial()){
    on<GetCancellationRateEvent>((event, emit) async {
      emit(CancellationRateLoadingState());
      var params = GetCancellationRateParams(id: event.id);
      var result = await getCancellationRate(params);
      result.fold((failure) => emit(CancellationRateInitial()), (rate) => emit(CancellationRateLoaded(rate: rate)));
    });
  }

}