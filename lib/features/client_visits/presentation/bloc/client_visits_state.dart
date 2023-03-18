

import 'package:equatable/equatable.dart';

class ClientVisitsState extends Equatable {
  const ClientVisitsState();

  @override
  List<Object> get props => [];
}

class ClientVisitsInitial extends ClientVisitsState {}

class ClientVisitsLoading extends ClientVisitsState {}

class ClientVisitsLoaded extends ClientVisitsState {
  final Map<String,double> data;

  const ClientVisitsLoaded({required this.data});

  @override
  List<Object> get props => [data];
}