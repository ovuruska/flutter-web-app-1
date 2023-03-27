


import 'package:equatable/equatable.dart';

class NoShowRateState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class NoShowRateLoadingState extends NoShowRateState {}
class NoShowRateInitial extends NoShowRateState {}
class NoShowRateLoaded extends NoShowRateState {
  final double rate;
  NoShowRateLoaded({required this.rate});
  @override
  List<Object?> get props => [rate];
}