import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_all_branches.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/callbacks/set_branch_callback.dart';
import '../../../../core/domain/entities/branch_entity.dart';
import '../../../../core/domain/repositories/branch_repository.dart';
import '../../../../core/use_case.dart';
import 'app_select_branch_event.dart';
import 'app_select_branch_state.dart';

class AppSelectBranchBloc
    extends Bloc<AppSelectBranchEvent, AppSelectBranchState> {
  final GetAllBranchesUseCase getAllBranches;

  AppSelectBranchBloc(this.getAllBranches) : super(AppSelectBranchStateLoading()) {
    on<AppBranchSelectEventGetAllBranches>((event, emit) async {
      var params = NoParams();
      var result = await getAllBranches(params);

      result.fold((l) => emit(AppSelectBranchStateLoaded(branches: [])), (r) {
        BranchEntity? branch;
        if (r.length > 0) {
          branch = r.first;
          getItMaybe<AppSelectBranchSetBranchCallback>()?.call(branch);
        }
        emit(AppSelectBranchStateLoaded(branches: r, branch: branch));

      });
    });

    on<AppSelectBranchSetBranchEvent>((event, emit) async {
      if (state is AppSelectBranchStateLoaded) {
        var stateAsLoaded = state as AppSelectBranchStateLoaded;
        var branch = stateAsLoaded.branches
            .firstWhere((element) => element == event.branch);
        emit(AppSelectBranchStateLoaded(branches: stateAsLoaded.branches, branch: branch));
      } else {
        emit(AppSelectBranchStateLoaded(branches: []));
      }
    });
  }
}
