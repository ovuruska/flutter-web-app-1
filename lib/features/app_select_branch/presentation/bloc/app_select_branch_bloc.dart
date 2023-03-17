import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/branch_repository.dart';
import 'app_select_branch_event.dart';
import 'app_select_branch_state.dart';

class AppSelectBranchBloc
    extends Bloc<CalendarAndBranchEvent, CalendarAndBranchState> {
  final AppSelectBranchRepository repository;

  AppSelectBranchBloc(this.repository) : super(Loading()) {
    on<GetAllBranchesEvent>((event, emit) async {
      var result = await repository.getBranches();
      result.fold(
          (l) => emit(Loaded(branches: [])), (r) => emit(Loaded(branches: r)));
    });
    on<AppSelectBranchSetBranchEvent>((event, emit) async {
      if(state is Loaded){
        var stateAsLoaded = state as Loaded;
        var branch = stateAsLoaded.branches.firstWhere((element) => element.id == event.id);
        emit(Loaded(branches: stateAsLoaded.branches,branch: branch));
      }else{
        emit(Loaded(branches:[]));

      }
    });
  }
}
