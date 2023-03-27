

import 'package:equatable/equatable.dart';

class MultiGroomerSelectEvent extends Equatable {
  const MultiGroomerSelectEvent();

  @override
  List<Object> get props => [];
}

class MultiGroomerSelectEventChanged extends MultiGroomerSelectEvent {
  final String query;

  const MultiGroomerSelectEventChanged({required this.query});

  @override
  List<Object> get props => [query];
}

class MultiGroomerSelectEventFetch extends MultiGroomerSelectEvent {}

