import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SchedulingContext extends Equatable{
  final double headerHeight;
  final double boxHeight;
  final double boxWidth;
  final double calendarMargin;
  final int startHour;
  final int topOffset;
  final int numberOfHours;
  final double hourColumnHeight;
  final double hourColumnWidth;
  final ScrollController verticalController = ScrollController();
  final ScrollController horizontalController = ScrollController();


  SchedulingContext({
    required this.headerHeight,
    required this.boxHeight,
    required this.boxWidth,
    required this.calendarMargin,
    required this.hourColumnHeight,
    required this.hourColumnWidth,
    required this.topOffset,
    this.startHour = 8,
    this.numberOfHours = 12,

  });

  @override
  List<Object?> get props => [headerHeight, boxHeight, boxWidth, calendarMargin];
}



