

import 'package:equatable/equatable.dart';

import '../../domain/entity/log_entity.dart';

class ViewLogsState extends Equatable {
  const ViewLogsState();

  @override
  List<Object> get props => [];
}

class Failed extends ViewLogsState {}


class Empty extends ViewLogsState {}

class Loading extends ViewLogsState {}

class Loaded extends ViewLogsState {
  final List<LogEntity> logs;

  Loaded({required this.logs});

  @override
  List<Object> get props => [logs];
}