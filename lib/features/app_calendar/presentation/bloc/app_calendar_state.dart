import 'package:equatable/equatable.dart';

class AppCalendarState extends Equatable {
  late DateTime date;

  AppCalendarState({DateTime? date}) {
    this.date = date ?? DateTime.now();
  }

  @override
  List<Object> get props => [date];
}
