

import 'package:equatable/equatable.dart';

class CalendarAndBranchEvent extends Equatable {
  @override
  List<Object?> get props => [];


}

class AppSelectBranchSetBranchEvent extends CalendarAndBranchEvent {
  final int id;
  AppSelectBranchSetBranchEvent(this.id);
}

class GetAllBranchesEvent extends CalendarAndBranchEvent {}

