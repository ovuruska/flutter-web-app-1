import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

CardSettingsSection appointmentSection({
  void Function(TimeOfDay?)? onTimeChanged,
  void Function(DateTime?)? onDateChanged,
  required List<Branch> branches,
  Function(Branch?)? onBranchSelected,


}) =>
    CardSettingsSection(

        header: CardSettingsHeader(
          label: 'Appointment ',
        ),
        children: <CardSettingsWidget>[

          CardSettingsDatePicker(
            label: 'Date',
            onSaved: onDateChanged,
          ),
          CardSettingsTimePicker(
            onSaved: onTimeChanged,
            label: 'Time',
          ),
          CardSettingsSelectionPicker<Branch>(items: branches, label: 'Branch', onSaved:onBranchSelected)


        ]);
