import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import 'branch_slot.dart';

@WidgetbookUseCase(
    name: 'Daily Slot - Morning and Afternoon Full', type: BranchSlot)
Widget branchSlotBothFull(BuildContext context) {
  var date = DateTime.now();
  var branchId = 1;
  var branchName = "Branch1";
  var morningCapacity = 0.8;
  var afternoonCapacity = 0.8;

  var dailySlotEntity = DailySlotEntity(
      date: date,
      branchName: branchName,
      branchId: branchId,
      morningCapacity: morningCapacity,
      afternoonCapacity: afternoonCapacity);
  return BranchSlot(slot: dailySlotEntity);
}

@WidgetbookUseCase(name: 'Daily Slot - Afternoon Full', type: BranchSlot)
Widget branchSlotAfternoonFull(BuildContext context) {
  var date = DateTime.now();
  var branchId = 1;
  var branchName = "Branch1";
  var morningCapacity = 0.4;
  var afternoonCapacity = 0.8;

  var dailySlotEntity = DailySlotEntity(
      date: date,
      branchId: branchId,
      branchName: branchName,
      morningCapacity: morningCapacity,
      afternoonCapacity: afternoonCapacity);
  return BranchSlot(slot: dailySlotEntity);
}

@WidgetbookUseCase(name: 'Daily Slot - Morning Full', type: BranchSlot)
Widget branchSlotMorningFull(BuildContext context) {
  var date = DateTime.now();
  var branchId = 1;
  var branchName = "Branch1";
  var morningCapacity = 0.8;
  var afternoonCapacity = 0.4;

  var dailySlotEntity = DailySlotEntity(
      date: date,
      branchId: branchId,
      branchName: branchName,
      morningCapacity: morningCapacity,
      afternoonCapacity: afternoonCapacity);

  return BranchSlot(slot: dailySlotEntity);
}

@WidgetbookUseCase(
    name: 'Daily Slot - Morning and Afternoon Empty', type: BranchSlot)
Widget branchSlotBothEmpty(BuildContext context) {
  var date = DateTime.now();
  var branchId = 1;
  var branchName = "Branch1";
  var morningCapacity = 0.4;
  var afternoonCapacity = 0.4;

  var dailySlotEntity = DailySlotEntity(
      date: date,
      branchId: branchId,
      branchName: branchName,
      morningCapacity: morningCapacity,
      afternoonCapacity: afternoonCapacity);

  return BranchSlot(slot: dailySlotEntity);
}
