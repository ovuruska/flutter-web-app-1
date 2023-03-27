

import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/appointment_slot_entity.dart';

class AvailableSlotsState extends Equatable{
  const AvailableSlotsState();

  @override
  List<Object?> get props => [];
}

class AvailableSlotsStateInitial extends AvailableSlotsState{}

class AvailableSlotsStateLoading extends AvailableSlotsState{}

class AvailableSlotsStateLoaded extends AvailableSlotsState{
  final List<AppointmentSlotEntity> slots;

  AvailableSlotsStateLoaded({required this.slots});

  @override
  List<Object?> get props => [slots];
}