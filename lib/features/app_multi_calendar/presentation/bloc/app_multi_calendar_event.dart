

import 'package:equatable/equatable.dart';

class AppMultiCalendarEvent extends Equatable {
  const AppMultiCalendarEvent();

  @override
  List<Object> get props => [];
}


class AppMultiCalendarEventSetDate extends AppMultiCalendarEvent {
  final DateTime date;

  const AppMultiCalendarEventSetDate({required this.date});

  @override
  List<Object> get props => [date];
}




