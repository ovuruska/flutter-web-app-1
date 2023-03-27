

import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/entities/pet_entity.dart';

class SelectClientPetsState extends Equatable {

  final int? id;
  final List<PetEntity> options;
  final PetEntity? selected;

  const SelectClientPetsState({
    this.id ,
    this.options = const [],
    this.selected = null,
  });

  @override
  List<Object> get props => [id ?? -1,options,selected ?? -1];
}