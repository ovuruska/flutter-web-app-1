import 'package:scrubbers_employee_application/common/blocs/list/controller.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_branch/model.dart';
import 'package:scrubbers_employee_application/widgets/weekly_schedule_branch/schedule.dart';

import '../repository.dart';

class AdminBranchesWeeklyScheduleBloc extends ListBloc<WeeklyScheduleBranchModel> {
  AdminBranchesWeeklyScheduleBloc([List<WeeklyScheduleBranchModel>? items])
      : super(items ?? WeeklyScheduleBranch.empty());

  @override
  void clear() {
    super.set(WeeklyScheduleBranch.empty());
  }

  void fetch(int employeeId){
    AdminBranchTabRepository.instance.getWeeklySchedule(employeeId)
        .then((value) => super.set(value as List<WeeklyScheduleBranchModel>? ?? WeeklyScheduleBranch.empty()));
  }

  void saveDay(int employeeId, WeeklyScheduleBranchModel row) {
    AdminBranchTabRepository.instance.setWorkingDay(employeeId, row);
  }

  void saveWeek(int employeeId, List<WeeklyScheduleBranchModel> items ){
    AdminBranchTabRepository.instance.setWeek(employeeId, items);
  }

}

final adminBranchesWeeklyScheduleBloc = AdminBranchesWeeklyScheduleBloc();
