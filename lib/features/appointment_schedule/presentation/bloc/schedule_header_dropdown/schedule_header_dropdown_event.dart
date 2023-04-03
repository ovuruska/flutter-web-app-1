import 'package:equatable/equatable.dart';

class ScheduleHeaderDropdownEvent extends Equatable {
  const ScheduleHeaderDropdownEvent();

  @override
  List<Object> get props => [];
}

class ScheduleHeaderDropdownEventSet extends ScheduleHeaderDropdownEvent {
  final String value;

  const ScheduleHeaderDropdownEventSet(this.value);

  @override
  List<Object> get props => [value];
}

