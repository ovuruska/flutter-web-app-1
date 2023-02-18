import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/repositories/working_hours/branch/repository.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_branch/model.dart';


class AdminBranchTabRepository {
  static final instance = AdminBranchTabRepository._();

  AdminBranchTabRepository._();

  Future<List<WeeklyScheduleBranchModel>?> getWeeklySchedule(int employeeId) async {
    var start = DateTime.now().startOfWeek();
    var end = DateTime.now().endOfWeek().add(Duration(days: 1));
    var ewh = await WorkingHoursBranchRepository.instance
        .getWorkingHours(employeeId, start, end);
    return ewh?.map<WeeklyScheduleBranchModel>((item) => WeeklyScheduleBranchModel.fromWorkingHour(item))
        .toList();
  }

  Future<void> setWeek(int employeeId, List<WeeklyScheduleBranchModel> items) async {
    items.forEach((element) async {
      await setWorkingDay(employeeId, element);
    });
  }

  Future<void> setWorkingDay(int employeeId, WeeklyScheduleBranchModel row) async {
    var working = row.working;
    var start = row.start;
    var end = row.end;
    if (working && end != null && start != null) {
      await WorkingHoursBranchRepository.instance
          .setWorkingHour(employeeId,  row.date,start, end);
    } else {

    }
  }
}
