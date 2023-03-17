import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/entities/branch_id_and_name.dart';

import '../../domain/repositories/branch_repository.dart';
import 'app_select_branch_event.dart';
import 'app_select_branch_state.dart';

class AppSelectBranchBloc
    extends Bloc<AppSelectBranchEvent, CalendarAndBranchState> {
  final AppSelectBranchRepository repository;

  AppSelectBranchBloc(this.repository) : super(Loading()) {
    on<GetAllBranchesEvent>((event, emit) async {
      var result = await repository.getBranches();

      result.fold((l) => emit(Loaded(branches: [])), (r) {
        BranchIdAndName? branch;
        if (r.length > 0) {
          branch = r.first;
          getItMaybe<AppSelectBranchSetBranchCallback>()?.call(branch);
        }
        emit(Loaded(branches: r, branch: branch));

      });
    });

    on<AppSelectBranchSetBranchEvent>((event, emit) async {
      if (state is Loaded) {
        var stateAsLoaded = state as Loaded;
        var branch = stateAsLoaded.branches
            .firstWhere((element) => element == event.branch);
        emit(Loaded(branches: stateAsLoaded.branches, branch: branch));
      } else {
        emit(Loaded(branches: []));
      }
    });
  }
}
