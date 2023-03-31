import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/create_branch.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/delete_branch.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_all_branches.dart';

import '../../../../../core/use_case.dart';
import 'search_branches_event.dart';
import 'search_branches_state.dart';

class SearchBranchesBloc
    extends Bloc<SearchBranchesEvent, SearchBranchesState> {
  final GetAllBranchesUseCase getBranches;
  final CreateBranchUseCase createNewBranch;
  final DeleteBranchUseCase removeBranch;

  SearchBranchesBloc({
    required this.createNewBranch,
    required this.getBranches,
    required this.removeBranch,
  }) : super(Empty()) {
    on<SearchBranchesEventGetBranches>((event, emit) async {
      emit(Loading());

      final failureOrBranches = await getBranches(NoParams());

      failureOrBranches.fold(
          (failure) => emit(Failed(message: "Failed to get branches.")),
          (branches) => emit(Loaded(branches: branches)));
    });
    on<SearchBranchesEventSetBranches>((event, emit) async {
      var branches = event.branches;
      emit(Loaded(branches: branches));
    });

    on<SearchBranchesEventPatch>((event, emit) async {
      var branch = event.branch;
      var branches = (state as Loaded).branches;
      List<BranchEntity> updatedBranches = branches.map<BranchEntity>((element) {
        if(element.id == branch.id) {
          return branch;
        }
        return element;
      }).toList();

      emit(Loaded(branches: updatedBranches));
    });
    on<SearchBranchesEventCreate>((event,emit) async {
      var branches = (state as Loaded).branches;
      emit(Loading());
      final failureOrBranch = await createNewBranch(NoParams());

      failureOrBranch.fold(
              (failure) => emit(Failed(message: "Failed to create new branch.")),
              (branch) => emit(Loaded(branches: branches + [branch])));
    });

    on<SearchBranchesEventRemove>((event, emit) async {
      var branches = (state as Loaded).branches;
      var id = event.id;
      removeBranch(DeleteBranchParams(id: id));
      var updatedBranches = branches.where((element) => element.id != id).toList();
      emit(Loaded(branches: updatedBranches));
    });
  }
}
