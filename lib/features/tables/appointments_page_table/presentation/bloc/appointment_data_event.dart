

import 'package:equatable/equatable.dart';

class AppointmentDataEvent extends Equatable {
  const AppointmentDataEvent();

  @override
  List<Object> get props => [];
}

class AppointmentDataEventSelect extends AppointmentDataEvent {
  final int selected;

  AppointmentDataEventSelect(this.selected);

  @override
  List<Object> get props => [selected];
}

class AppointmentDataEventDeselect extends AppointmentDataEvent {
  const AppointmentDataEventDeselect();

}