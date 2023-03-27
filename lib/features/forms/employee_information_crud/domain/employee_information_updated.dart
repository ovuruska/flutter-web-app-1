

import '../../../../core/domain/entities/employee_entity.dart';

abstract class EmployeeInformationUpdatedCallback{
  void call(EmployeeEntity employee);
}