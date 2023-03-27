import 'package:equatable/equatable.dart';

class AverageServiceTimeEvent extends Equatable {
  const AverageServiceTimeEvent();

  @override
  List<Object> get props => [];
}

class AverageServiceTimeFetchEvent extends AverageServiceTimeEvent {
  final int id;

  const AverageServiceTimeFetchEvent({required this.id});

  @override
  List<Object> get props => [id];

}