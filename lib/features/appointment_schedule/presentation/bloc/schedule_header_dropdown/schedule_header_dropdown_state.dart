import 'package:equatable/equatable.dart';

class ScheduleHeaderDropdownState extends Equatable {
  final String value;

  const ScheduleHeaderDropdownState({
    this.value = 'All Employees',
  });

  @override
  List<Object> get props => [value];
}
