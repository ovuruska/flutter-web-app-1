import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';

import '../../domain/all_breeds.dart';

CardSettingsSection customerSection({
  TextEditingController? nameController,
  TextEditingController? petController,
  TextEditingController? phoneController,
  TextEditingController? emailController,
  TextEditingController? breedController,
}) =>
    CardSettingsSection(
        header: CardSettingsHeader(
          label: 'Customer ',
        ),
        children: <CardSettingsWidget>[
          CardSettingsText(
            controller: nameController,
            maxLength: 100,
            label: 'Name',
          ),
          CardSettingsText(
            controller: petController,
            label: 'Pet',
          ),
          CardSettingsText(
            controller: emailController,
            label: 'Email',
            maxLength: 100,
          ),
          CardSettingsListPicker<String>(
              label:"Breed", items: allBreeds,
            initialItem: (allBreeds.isEmpty) ? null : allBreeds.first,
            onChanged: (value) {
                if (value != null) breedController!.text = value;
            },
          ),
          CardSettingsText(
            label: 'Phone',
            controller: phoneController,
          ),
        ]);
