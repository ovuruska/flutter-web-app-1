


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/usecases/get_average_service_time.dart';
import 'average_service_time_event.dart';
import 'average_service_time_state.dart';

class AverageServiceTimeBloc extends Bloc<AverageServiceTimeEvent,AverageServiceTimeState> {
  final GetAverageServiceTimeUseCase getAverageServiceTime;

  AverageServiceTimeBloc(this.getAverageServiceTime) : super(AverageServiceTimeState()){
    on<AverageServiceTimeFetchEvent>((event, emit) async {
      var params = GetAverageServiceTimeParams(id: event.id);
      final response = await getAverageServiceTime(params);
      final averageServiceTime = response.fold((l) => null, (r) => r);
      emit(AverageServiceTimeState(averageServiceTime: averageServiceTime));
    });
  }



}