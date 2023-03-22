import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/entities/branch_id_and_name.dart';

import '../../domain/repositories/branch_repository.dart';
import 'app_select_branch_event.dart';
import 'app_select_branch_state.dart';

class AppSelectBranchBloc
    extends Bloc<AppSelectBranchEvent, AppSelectBranchState> {
  final AppSelectBranchRepository repository;

  AppSelectBranchBloc(this.repository) : super(AppBranchStateLoading()) {
    on<AppBranchSelectEventGetAllBranches>((event, emit) async {
      var result = await repository.getBranches();

      result.fold((l) => emit(AppBranchStateLoaded(branches: [])), (r) {
        BranchIdAndName? branch;
        if (r.length > 0) {
          branch = r.first;
          getItMaybe<AppSelectBranchSetBranchCallback>()?.call(branch);
        }
        emit(AppBranchStateLoaded(branches: r, branch: branch));

      });
    });

    on<AppSelectBranchSetBranchEvent>((event, emit) async {
      if (state is AppBranchStateLoaded) {
        var stateAsLoaded = state as AppBranchStateLoaded;
        var branch = stateAsLoaded.branches
            .firstWhere((element) => element == event.branch);
        emit(AppBranchStateLoaded(branches: stateAsLoaded.branches, branch: branch));
      } else {
        emit(AppBranchStateLoaded(branches: []));
      }
    });
  }
}
