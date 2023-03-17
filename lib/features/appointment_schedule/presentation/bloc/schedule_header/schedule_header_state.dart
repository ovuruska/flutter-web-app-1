import 'package:equatable/equatable.dart';

class ScheduleHeaderState extends Equatable {
  final DateTime date;
  final int? branch;

  const ScheduleHeaderState({
    required this.date,
    this.branch,
  });

  @override
  List<Object> get props => [branch ?? -1, date];
}
