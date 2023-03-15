

import 'package:equatable/equatable.dart';

class NoShowRateEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetNoShowRateEvent extends NoShowRateEvent {
  final int id;

  GetNoShowRateEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];

}