import 'package:equatable/equatable.dart';

class AppointmentsPageTableState extends Equatable {
  final int? selected;

  AppointmentsPageTableState({this.selected});

  @override
  List<Object?> get props => [selected ?? -1];
}

