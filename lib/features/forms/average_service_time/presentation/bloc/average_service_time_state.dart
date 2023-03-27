

import 'package:equatable/equatable.dart';

class AverageServiceTimeState extends Equatable {
  final double? averageServiceTime;
  const AverageServiceTimeState({
    this.averageServiceTime,
  });

  @override
  List<Object> get props => [averageServiceTime ?? 0];
}