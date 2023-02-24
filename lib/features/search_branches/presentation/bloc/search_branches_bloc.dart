import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/use_case.dart';
import '../../domain/usecases/get_branches.dart';
import 'search_branches_event.dart';
import 'search_branches_state.dart';

class SearchBranchesBloc
    extends Bloc<SearchBranchesEvent, SearchBranchesState> {
  final GetBranches getBranches;

  SearchBranchesBloc({
    required this.getBranches,
  }) : super(Empty()) {
    on<GetBranchesEvent>((event, emit) async {
      emit(Loading());

      final failureOrBranches = await getBranches(NoParams());

      failureOrBranches.fold(
          (failure) => emit(Failed(message: "Failed to get branches.")
              as SearchBranchesState),
          (branches) => emit(Loaded(branches: branches)));
    });
  }
}
