

import '../entities/employee_entity.dart';

abstract class SaveEmployeeRepository {
  Future<void> save(EmployeeEntity employee);
}
