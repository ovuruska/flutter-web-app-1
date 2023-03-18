import 'package:equatable/equatable.dart';

class ScheduleHeaderDropdownEvent extends Equatable {
  const ScheduleHeaderDropdownEvent();

  @override
  List<Object> get props => [];
}

class ScheduleHeaderDropdownSetEvent extends ScheduleHeaderDropdownEvent {
  final String value;

  const ScheduleHeaderDropdownSetEvent(this.value);

  @override
  List<Object> get props => [value];
}

