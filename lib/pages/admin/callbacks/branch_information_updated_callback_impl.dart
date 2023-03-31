

import 'package:scrubbers_employee_application/features/forms/branch_information_crud/domain/branch_information_updated.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/features/sidebars/branch_search/presentation/bloc/search_branches_event.dart';
import 'package:scrubbers_employee_application/injection.dart';

import '../../../core/domain/entities/branch_entity.dart';

class BranchInformationUpdatedCallbackImpl extends BranchInformationUpdatedCallback {
  @override
  void call(BranchEntity branch) {
    sl<SearchBranchesBloc>().add(
      SearchBranchesEventPatch(branch: branch),
    );
  }
}