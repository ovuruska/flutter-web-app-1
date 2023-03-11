import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/branch_repository.dart';
import 'calendar_and_branch_event.dart';
import 'calendar_and_branch_state.dart';

class CalendarAndBranchBloc
    extends Bloc<CalendarAndBranchEvent, CalendarAndBranchState> {
  final CalendarAndBranchRepository repository;

  CalendarAndBranchBloc(this.repository) : super(Loading()) {
    on<GetAllBranchesEvent>((event, emit) async {
      var result = await repository.getBranches();
      result.fold(
          (l) => emit(Loaded(branches: [])), (r) => emit(Loaded(branches: r)));
    });
  }
}
