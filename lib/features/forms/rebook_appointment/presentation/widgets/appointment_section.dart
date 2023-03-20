import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import '../../domain/entities/branch_entity.dart';

CardSettingsSection appointmentSection({
  void Function(TimeOfDay?)? onTimeChanged,
  void Function(DateTime?)? onDateChanged,
  Function(int?)? onDurationChanged,
  Function(String?)? onServiceChanged,
}) =>
    CardSettingsSection(
        header: CardSettingsHeader(
          label: 'Appointment ',
        ),
        children: <CardSettingsWidget>[
          CardSettingsListPicker(
            items: ["We Wash", "Full Grooming"],
            label: "Service",
            initialItem: "We Wash",
            onChanged: onServiceChanged,
          ),
          CardSettingsDatePicker(
            label: 'Date',
            onChanged: onDateChanged,
          ),
          CardSettingsTimePicker(
            onChanged: onTimeChanged,
            label: 'Time',
          ),
          CardSettingsNumberPicker(
            min: 15,
            max: 180,
            label: 'Duration',
            initialValue: 60,
            stepInterval: 15,
            onChanged: onDurationChanged,
          ),
        ]);
