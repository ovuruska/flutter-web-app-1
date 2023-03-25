

import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/pet_entity.dart';

class SelectClientPetsEvent extends Equatable {
  const SelectClientPetsEvent();

  @override
  List<Object> get props => [];
}

class SelectClientPetsEventCleared extends SelectClientPetsEvent {}

class SelectClientPetsEventOptionsChanged extends SelectClientPetsEvent {
  final List<PetEntity> options;

  const SelectClientPetsEventOptionsChanged({
    this.options = const [],
  });

  @override
  List<Object> get props => [options];
}

class SelectClientPetsEventFetchClientPets extends SelectClientPetsEvent {
  final int id;

  const SelectClientPetsEventFetchClientPets({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}


class SelectClientPetsEventSelect extends SelectClientPetsEvent {
  final PetEntity? selected;

  const SelectClientPetsEventSelect({
    this.selected = null,
  });

  @override
  List<Object> get props => [selected ?? ""];
}
