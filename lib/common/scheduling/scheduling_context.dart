import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SchedulingContext extends Equatable {
  final double headerHeight;
  final double boxHeight;
  final double boxWidth;
  final double calendarMargin;
  final int startHour;
  final int topOffset;
  final int endHour;
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
    this.endHour = 20,
  });

  @override
  List<Object?> get props =>
      [headerHeight, boxHeight, boxWidth, calendarMargin];

  SchedulingContext copyWith({
    double? headerHeight,
    double? boxHeight,
    double? boxWidth,
    double? calendarMargin,
    int? startHour,
    int? endHour,
    double? hourColumnHeight,
    double? hourColumnWidth,
    int? topOffset,
  }) =>
      SchedulingContext(
        headerHeight: headerHeight ?? this.headerHeight,
        boxHeight: boxHeight ?? this.boxHeight,
        boxWidth: boxWidth ?? this.boxWidth,
        calendarMargin: calendarMargin ?? this.calendarMargin,
        startHour: startHour ?? this.startHour,
        endHour: endHour ?? this.endHour,
        hourColumnHeight: hourColumnHeight ?? this.hourColumnHeight,
        hourColumnWidth: hourColumnWidth ?? this.hourColumnWidth,
        topOffset: topOffset ?? this.topOffset,
      );
}
