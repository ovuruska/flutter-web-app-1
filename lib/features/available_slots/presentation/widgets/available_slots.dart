

import 'package:flutter/material.dart';

import '../../../../core/domain/entities/appointment_slot_entity.dart';
import 'appointment_slot_card.dart';

class AvailableSlots extends StatelessWidget {
  final List<AppointmentSlotEntity> slots;
  final Function(AppointmentSlotEntity)? onTap;

  AvailableSlots({
    Key? key,
    required this.slots,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: slots.length,
      itemBuilder: (context, index) {
        return Container(
            margin:EdgeInsets.symmetric(vertical:4),
            child:AppointmentSlotCard(
          slot: slots[index],
          onTap: onTap,
        ));
      },
    );
  }
}