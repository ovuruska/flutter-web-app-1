import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/employee_wh.dart';

class WeeklyScheduleEmployeeModel {
  final bool working;
  final DateTime date;
  final DateTime? start;
  final DateTime? end;
  final Branch? branch;

  copyWith({
    bool? working,
    DateTime? date,
    DateTime? start,
    DateTime? end,
    Branch? branch,
  }) {
    return WeeklyScheduleEmployeeModel(
      working: working ?? this.working,
      date: date ?? this.date,
      start: start ?? this.start,
      end: end ?? this.end,
      branch: branch ?? this.branch,
    );
  }

  WeeklyScheduleEmployeeModel(
      {required this.working,
      required this.date,
      this.start,
      this.end,
      this.branch});

  operator ==(other) => other is WeeklyScheduleEmployeeModel && other.date == date;

  static WeeklyScheduleEmployeeModel fromWorkingHour(EmployeeWorkingDay day) {
    var start = day.date.startOfDay;
    var end = start.add(Duration(days:1));



    return WeeklyScheduleEmployeeModel(
        working: day.branch == null ? false :true,
        start: day.start,
        end: day.end,
        date: day.date,
        branch: day.branch);
  }
}

class WeeklyScheduleModel {
  final List<WeeklyScheduleEmployeeModel> rows;

  WeeklyScheduleModel({required this.rows});
}
