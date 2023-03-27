

import 'package:flutter/material.dart';

import '../../../../available_slots/presentation/pages/available_slots.dart';

class RebookAvailableSlots extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: AvailableSlotsView(),
    );
  }

}