import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/branch_wh.dart';
import 'package:scrubbers_employee_application/models/employee_wh.dart';

class WeeklyScheduleBranchModel {
  final bool working;
  final DateTime date;
  final DateTime? start;
  final DateTime? end;

  copyWith({
    bool? working,
    DateTime? date,
    DateTime? start,
    DateTime? end,
    Branch? branch,
  }) {
    return WeeklyScheduleBranchModel(
      working: working ?? this.working,
      date: date ?? this.date,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  WeeklyScheduleBranchModel(
      {required this.working,
      required this.date,
      this.start,
      this.end});

  operator ==(other) => other is WeeklyScheduleBranchModel && other.date == date  ;

  static WeeklyScheduleBranchModel fromWorkingHour(BranchWorkingHour day) {

    return WeeklyScheduleBranchModel(
        working: day.start == null ? false : true,
        start: day.start,
        end: day.end,
        date: day.date,
        );
  }
}

class WeeklyScheduleModel {
  final List<WeeklyScheduleBranchModel> rows;

  WeeklyScheduleModel({required this.rows});
}
