

import 'package:equatable/equatable.dart';

import '../../domain/entities/client_information.dart';

class ClientInformationState extends Equatable {
  const ClientInformationState();

  @override
  List<Object> get props => [];
}

class ClientInformationInitial extends ClientInformationState {}

class ClientInformationLoading extends ClientInformationState {}

class ClientInformationLoaded extends ClientInformationState {
  final ClientInformation clientInformation;

  ClientInformationLoaded({required this.clientInformation});

  @override
  List<Object> get props => [clientInformation];
}