import 'package:equatable/equatable.dart';

class AppointmentScheduleHeaderState extends Equatable {
  final DateTime date;
  final int? branch;

  const AppointmentScheduleHeaderState({
    required this.date,
    this.branch,
  });

  @override
  List<Object> get props => [branch ?? -1, date];
}
