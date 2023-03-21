

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_all_branches.dart';

import '../../../../../core/domain/entities/branch_entity.dart';
import '../../../../../core/use_case.dart';
import 'branch_select_event.dart';
import 'branch_select_state.dart';

class BranchSelectBloc extends Bloc<BranchSelectEvent,BranchSelectState>{
  final GetAllBranchesUseCase getAllBranches;

  BranchSelectBloc(this.getAllBranches) : super(BranchSelectState(options: [])){
    on<BranchSelectEventFetch>((event, emit) async {
      var params = NoParams();
      final result = await getAllBranches(params);
      List<BranchEntity> options = result.fold((l) => [], (r) => r);
      emit(BranchSelectState(options: options));
    });
  }

}