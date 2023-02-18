import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/repositories/working_hours/employee/repository.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_employee/model.dart';

class AdminEmployeeTabRepository {
  static final instance = AdminEmployeeTabRepository._();

  AdminEmployeeTabRepository._();

  Future<List<WeeklyScheduleEmployeeModel>?> getWeeklySchedule(int employeeId) async {
    var start = DateTime.now().startOfWeek();
    var end = DateTime.now().endOfWeek().add(Duration(days: 1));
    var ewh = await WorkingHoursEmployeeRepository.instance
        .getWorkingHours(employeeId, start, end);
    return ewh?.workingDays
        .map<WeeklyScheduleEmployeeModel>((item) => WeeklyScheduleEmployeeModel.fromWorkingHour(item))
        .toList();
  }

  clearWorkingHour(int employeeId, DateTime date) {
    WorkingHoursEmployeeRepository.instance.clearWorkingHour(employeeId, date);
  }

  Future<void> setWeek(int employeeId, List<WeeklyScheduleEmployeeModel> items) async {
    items.forEach((element) async {
      await setWorkingDay(employeeId, element);
    });
  }

  Future<void> setWorkingDay(int employeeId, WeeklyScheduleEmployeeModel row) async {
    var working = row.working;
    var start = row.start;
    var end = row.end;
    var branch = row.branch;
    if (working && end != null && start != null && branch != null) {
      await WorkingHoursEmployeeRepository.instance
          .setWorkingHour(employeeId, branch.id,  row.date,start, end,);
    } else {
      await WorkingHoursEmployeeRepository.instance
          .clearWorkingHour(employeeId, row.date);
    }
  }
}
