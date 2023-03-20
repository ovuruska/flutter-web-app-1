

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/pet_entity.dart';

class SelectClientPetsState extends Equatable {

  final List<PetEntity> options;
  final PetEntity? selected;

  const SelectClientPetsState({
    this.options = const [],
    this.selected = null,
  });

  @override
  List<Object> get props => [];
}