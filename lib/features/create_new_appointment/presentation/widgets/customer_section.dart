import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';



CardSettingsSection customerSection({
  TextEditingController? nameController,
  TextEditingController? petController,
  TextEditingController? phoneController,
}) =>  CardSettingsSection(
    header:CardSettingsHeader(
      label: 'Customer ',
    ),
    children:<CardSettingsWidget>[
      CardSettingsText(
        controller: nameController,
        label: 'Name',

      ),
      CardSettingsText(
        controller: petController,
        label: 'Pet',
      ),
      CardSettingsText(
        label: 'Phone',
        controller: phoneController,
      ),

    ]
);
