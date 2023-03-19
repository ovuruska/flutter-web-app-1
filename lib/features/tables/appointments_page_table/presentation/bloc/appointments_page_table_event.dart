

import 'package:equatable/equatable.dart';

class AppointmentsPageTableEvent extends Equatable {
  const AppointmentsPageTableEvent();

  @override
  List<Object> get props => [];
}

class AppointmentsPageTableEventSelect extends AppointmentsPageTableEvent {
  final int selected;

  AppointmentsPageTableEventSelect(this.selected);

  @override
  List<Object> get props => [selected];
}

class AppointmentsPageTableEventDeselect extends AppointmentsPageTableEvent {
  const AppointmentsPageTableEventDeselect();

}