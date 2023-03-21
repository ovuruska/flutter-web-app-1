import 'package:equatable/equatable.dart';

class AppMultiCalendarState extends Equatable {
  late DateTime date;
  AppMultiCalendarState({DateTime? date}) {
    this.date = date ?? DateTime.now();
  }

  @override
  List<Object> get props => [date];
}
