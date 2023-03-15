


import 'package:equatable/equatable.dart';

class NoShowRateState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class NoShowRateLoadingState extends NoShowRateState {}
class NoShowRateInitial extends NoShowRateState {}
class NoShowRateLoaded extends NoShowRateState {
  final double cancellationRate;
  NoShowRateLoaded({required this.cancellationRate});
  @override
  List<Object?> get props => [cancellationRate];
}