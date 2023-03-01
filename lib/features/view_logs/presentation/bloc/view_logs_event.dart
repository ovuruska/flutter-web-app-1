

import 'package:equatable/equatable.dart';

import '../../domain/entity/log_entity.dart';

class ViewLogsEvent extends Equatable {
  const ViewLogsEvent();

  @override
  List<Object> get props => [];
}

class GetLogsEvent extends ViewLogsEvent {
  final int id;

  GetLogsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class SetLogsEvent extends ViewLogsEvent {
  final List<LogEntity> logs;

  SetLogsEvent({required this.logs});

  @override
  List<Object> get props => [logs];
}