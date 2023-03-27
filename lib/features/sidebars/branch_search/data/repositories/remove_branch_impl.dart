import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/repositories/remove_branch.dart';



class RemoveBranchRepositoryImpl implements RemoveBranchRepository{

    RemoveBranchRepositoryImpl();

  @override
  Future<void> remove(int branchId) async {
    await SchedulingAuthService.instance.request("/api/branch/$branchId", method: "DELETE");
  }


}