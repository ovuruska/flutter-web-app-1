

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DogAppointmentsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPetAppointments extends DogAppointmentsEvent {
  final int petId;

  GetPetAppointments(this.petId);

  @override
  List<Object> get props => [petId];

}


