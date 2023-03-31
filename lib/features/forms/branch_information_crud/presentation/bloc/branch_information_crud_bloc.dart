

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_branch.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/patch_branch.dart';

import '../../../../../core/domain/usecases/get_employee.dart';
import '../../../../../core/domain/usecases/patch_employee.dart';
import 'branch_information_crud_event.dart';
import 'branch_information_crud_state.dart';

class BranchInformationCrudBloc extends Bloc<BranchInformationCrudEvent,BranchInformationCrudState>{
  final GetBranchUseCase getBranch;
  final PatchBranchUseCase patchBranch;


  BranchInformationCrudBloc({
    required this.getBranch, required this.patchBranch
  }) : super(BranchInformationCrudState()){
    on<BranchInformationCrudEventGet>((event, emit) async {
      final result = await getBranch(GetBranchParams(id: event.id));
      result.fold((l) => emit(BranchInformationCrudState()), (r) => emit(BranchInformationCrudState(branch: r)));
    });
    on<BranchInformationCrudEventSet>((event, emit) async {
      var newState = BranchInformationCrudState(branch: event.branch);
      emit(newState);
    });
    on<BranchInformationCrudEventPatch>((event, emit) async {
      var params = PatchBranchParams(branch: event.branch);
      final result = await patchBranch(params);
    });
  }
}