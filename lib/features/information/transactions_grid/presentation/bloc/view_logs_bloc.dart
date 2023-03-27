import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/view_logs_repository.dart';
import 'view_logs_event.dart';
import 'view_logs_state.dart';

class ViewLogsBloc
    extends Bloc<ViewLogsEvent, ViewLogsState> {

  ViewLogsRepository viewLogsRepository;

  ViewLogsBloc({
    required this.viewLogsRepository,
  }) : super(Empty()) {
    on<GetLogsEvent>((event, emit) async {
      emit(Loading());
      var result = await viewLogsRepository.getLogs(event.id);

      result.fold((l) => emit(Failed()), (r) => emit(Loaded(logs: r)));
    });
    on<SetLogsEvent>((event, emit) async {
      emit(Loaded(logs: event.logs));
    });
  }
}
