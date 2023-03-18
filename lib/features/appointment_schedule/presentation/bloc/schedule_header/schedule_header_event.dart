

import 'package:equatable/equatable.dart';


class ScheduleHeaderEvent extends Equatable {
  const ScheduleHeaderEvent();

  @override
  List<Object> get props => [];
}

class ScheduleHeaderSetDateEvent extends ScheduleHeaderEvent{
  final DateTime date;

  ScheduleHeaderSetDateEvent({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}

class ScheduleHeaderSetBranchEvent extends ScheduleHeaderEvent{
  final int? branch;

  ScheduleHeaderSetBranchEvent({
    required this.branch,
  });

  @override
  List<Object> get props => [branch ?? -1];
}