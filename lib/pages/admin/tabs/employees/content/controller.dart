import 'package:scrubbers_employee_application/common/blocs/list/controller.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_employee/model.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_employee/schedule.dart';

import '../repository.dart';

class AdminEmployeesWeeklyScheduleBloc extends ListBloc<WeeklyScheduleEmployeeModel> {
  AdminEmployeesWeeklyScheduleBloc([List<WeeklyScheduleEmployeeModel>? items])
      : super(items ?? WeeklyScheduleEmployee.empty());

  @override
  void clear() {
    super.set(WeeklyScheduleEmployee.empty());
  }

  void fetch(int employeeId){
    AdminEmployeeTabRepository.instance.getWeeklySchedule(employeeId)
    .then((value) => super.set(value ?? WeeklyScheduleEmployee.empty()));
  }

  void saveDay(int employeeId, WeeklyScheduleEmployeeModel row) {
    AdminEmployeeTabRepository.instance.setWorkingDay(employeeId, row);
  }

  void saveWeek(int employeeId, List<WeeklyScheduleEmployeeModel> items ){
    AdminEmployeeTabRepository.instance.setWeek(employeeId, items);
  }

}

final adminEmployeesWeeklyScheduleBloc = AdminEmployeesWeeklyScheduleBloc();
