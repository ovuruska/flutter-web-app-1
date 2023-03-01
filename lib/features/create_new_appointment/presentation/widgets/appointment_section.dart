import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';

CardSettingsSection appointmentSection({
  void Function(TimeOfDay?)? onTimeChanged,
  void Function(DateTime?)? onDateChanged,
}) =>
    CardSettingsSection(

        header: CardSettingsHeader(
          label: 'Appointment ',
        ),
        children: <CardSettingsWidget>[

          CardSettingsDatePicker(
            label: 'Name',
            onSaved: onDateChanged,
          ),
          CardSettingsTimePicker(
            onSaved: onTimeChanged,
            label: 'Pet',
          ),

        ]);
