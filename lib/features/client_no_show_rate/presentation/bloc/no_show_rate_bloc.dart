

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_no_show_rate.dart';
import 'no_show_rate_event.dart';
import 'no_show_rate_state.dart';

class NoShowRateBloc extends Bloc<NoShowRateEvent,NoShowRateState>{
  final GetNoShowRateUseCase getNoShowRate;

  NoShowRateBloc(this.getNoShowRate) : super(NoShowRateInitial()){
    on<GetNoShowRateEvent>((event, emit) async {
      emit(NoShowRateLoadingState());
      var params = GetNoShowRateParams(id: event.id);
      var result = await getNoShowRate(params);
      emit(NoShowRateLoaded(cancellationRate: 0.0));
    });
  }

}