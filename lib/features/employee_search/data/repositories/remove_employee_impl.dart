


import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/repositories/remove_employee.dart';

class RemoveEmployeeRepositoryImpl extends RemoveEmployeeRepository{
  @override
  Future<void> remove(int id) async {
    await SchedulingAuthService.instance.request("/api/employee/$id", method:"DELETE");
  }

}