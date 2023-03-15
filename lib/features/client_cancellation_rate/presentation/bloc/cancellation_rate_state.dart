


import 'package:equatable/equatable.dart';

class CancellationRateState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CancellationRateLoadingState extends CancellationRateState {}
class CancellationRateInitial extends CancellationRateState {}
class CancellationRateLoaded extends CancellationRateState {
  final double rate;
  CancellationRateLoaded({required this.rate});
  @override
  List<Object?> get props => [rate];
}