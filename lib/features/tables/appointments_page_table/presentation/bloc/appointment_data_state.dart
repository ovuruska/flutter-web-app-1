import 'package:equatable/equatable.dart';

class AppointmentDataState extends Equatable {
  final int? selected;

  AppointmentDataState({this.selected});

  @override
  List<Object?> get props => [selected ?? -1];
}

