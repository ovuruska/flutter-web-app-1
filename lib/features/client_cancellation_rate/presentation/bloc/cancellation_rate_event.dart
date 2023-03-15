

import 'package:equatable/equatable.dart';

class CancellationRateEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetCancellationRateEvent extends CancellationRateEvent {
  final int id;

  GetCancellationRateEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];

}