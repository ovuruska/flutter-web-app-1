import 'package:equatable/equatable.dart';


class AppCalendarEvent extends Equatable {
  const AppCalendarEvent();

  @override
  List<Object> get props => [];
}

class AppCalendarSetDateEvent extends AppCalendarEvent {
  final DateTime date;

  AppCalendarSetDateEvent(this.date);

  @override
  List<Object> get props => [date];
}