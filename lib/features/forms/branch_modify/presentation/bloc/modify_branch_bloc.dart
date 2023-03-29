import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/branch_entity.dart';
import '../../domain/usecases/save_branch.dart';
import '../../domain/usecases/set_branch.dart';
import 'modify_branch_event.dart';
import 'modify_branch_state.dart';

class ModifyBranchBloc
    extends Bloc<ModifyBranchBaseEvent, ModifyBranchState> {
  final SaveBranchUseCase modifyBranch;
  final SetBranchUseCase setBranch;

  ModifyBranchBloc({
    required this.setBranch,
    required this.modifyBranch,
  }) : super(Empty()) {
    on<ModifyBranchEvent>((event, emit) async {
      emit(Loading());
      var branch = event.branch;
      final failureOrBranches = await modifyBranch(SaveBranchParams(branch: branch));

      failureOrBranches.fold(
              (failure) => emit(Failed(message: "Failed to get branches.")),
              (branches) => emit(Updated(branch: branch)));
    });

    on<SetBranchEvent>((event, emit) async {
      emit(SetBranch(branch: BranchEntity.fromBranch(event.branch)));
    });

    on<ClearBranchEvent>((event, emit) async {
      emit(Empty());
    });
  }
}
