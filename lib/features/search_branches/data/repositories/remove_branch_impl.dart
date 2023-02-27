

import 'package:scrubbers_employee_application/features/search_branches/domain/repositories/remove_branch.dart';
import 'package:scrubbers_employee_application/services/auth.dart';



class RemoveBranchRepositoryImpl implements RemoveBranchRepository{

    RemoveBranchRepositoryImpl();

  @override
  Future<void> remove(int branchId) async {
    await SchedulingAuthService.instance.request("/api/branch/$branchId", method: "DELETE");
  }


}