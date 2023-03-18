

import 'package:equatable/equatable.dart';

import '../../domain/entities/client_pet_item.dart';

class ClientPetsState extends Equatable {
  const ClientPetsState();

  @override
  List<Object> get props => [];
}

class ClientPetsInitial extends ClientPetsState {}

class ClientPetsLoading extends ClientPetsState {}

class ClientPetsLoaded extends ClientPetsState {
  final List<ClientPetItem> pets;

  ClientPetsLoaded({required this.pets});

  @override
  List<Object> get props => [pets];
}