
import 'package:equatable/equatable.dart';

class IntervalEntity extends Equatable{
  final DateTime start;
  final DateTime end;




  IntervalEntity({
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [start,end];
}