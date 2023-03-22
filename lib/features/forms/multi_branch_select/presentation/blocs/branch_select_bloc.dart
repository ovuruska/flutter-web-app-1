

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_all_branches.dart';

import '../../../../../core/domain/entities/branch_entity.dart';
import '../../../../../core/use_case.dart';
import 'branch_select_event.dart';
import 'branch_select_state.dart';

class MultiBranchSelectBloc extends Bloc<MultiBranchSelectEvent,MultiBranchSelectState>{
  final GetAllBranchesUseCase getAllBranches;

  MultiBranchSelectBloc(this.getAllBranches) : super(MultiBranchSelectState(options: [])){
    on<MultiBranchSelectEventFetch>((event, emit) async {
      var params = NoParams();
      final result = await getAllBranches(params);
      List<BranchEntity> options = result.fold((l) => [], (r) => r);
      emit(MultiBranchSelectState(options: options));
    });
  }

}