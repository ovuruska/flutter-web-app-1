


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_distribution.dart';
import 'client_top_category_event.dart';
import 'client_top_category_state.dart';

class ClientTopCategoryBloc extends Bloc<ClientTopCategoryEvent,ClientTopCategoryState>{
  final GetDistributionUseCase getDistribution;

  ClientTopCategoryBloc({
    required this.getDistribution
  }) : super(ClientTopCategoryInitial()){
    on<GetClientTopCategoryDistributionEvent>((event, emit) async {
      emit(ClientTopCategoryLoading());
      var clientId = event.id;
      var params = GetDistributionParams(clientId);
      var result = await getDistribution(params);
      result.fold((failure) => emit(ClientTopCategoryInitial()), (data) => emit(ClientTopCategoryLoaded(data: data)));
    });
  }
}