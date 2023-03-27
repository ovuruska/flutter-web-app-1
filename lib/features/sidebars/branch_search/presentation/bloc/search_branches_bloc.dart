import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/use_case.dart';
import '../../domain/usecases/create_new_branch.dart';
import '../../domain/usecases/get_branches.dart';
import '../../domain/usecases/remove_branch.dart';
import 'search_branches_event.dart';
import 'search_branches_state.dart';

class SearchBranchesBloc
    extends Bloc<SearchBranchesEvent, SearchBranchesState> {
  final GetBranchesUseCase getBranches;
  final CreateNewBranchUseCase createNewBranch;
  final RemoveBranchUseCase removeBranch;

  SearchBranchesBloc({
    required this.createNewBranch,
    required this.getBranches,
    required this.removeBranch,
  }) : super(Empty()) {
    on<GetBranchesEvent>((event, emit) async {
      emit(Loading());

      final failureOrBranches = await getBranches(NoParams());

      failureOrBranches.fold(
          (failure) => emit(Failed(message: "Failed to get branches.")
              as SearchBranchesState),
          (branches) => emit(Loaded(branches: branches)));
    });
    on<SetBranchesEvent>((event, emit) async {
      var branches = event.branches;
      emit(Loaded(branches: branches));
    });

    on<PatchBranchEvent>((event, emit) async {
      var branch = event.branch;
      var branches = (state as Loaded).branches;
      var updatedBranches = branches.map((element) {
        if(element.id == branch.id) {
          return branch;
        }
        return element;
      }).toList();

      emit(Loaded(branches: updatedBranches));
    });
    on<CreateNewBranchEvent>((event,emit) async {
      var branches = (state as Loaded).branches;
      emit(Loading());
      final failureOrBranch = await createNewBranch(NoParams());

      failureOrBranch.fold(
              (failure) => emit(Failed(message: "Failed to create new branch.")
              as SearchBranchesState),
              (branch) => emit(Loaded(branches: branches + [branch])));
    });

    on<RemoveBranchEvent>((event, emit) async {
      var branches = (state as Loaded).branches;
      var id = event.id;
      removeBranch(RemoveBranchParams(id: id));
      var updatedBranches = branches.where((element) => element.id != id).toList();
      emit(Loaded(branches: updatedBranches));
    });
  }
}
