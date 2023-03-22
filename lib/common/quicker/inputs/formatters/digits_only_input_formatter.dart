import 'package:flutter/services.dart';

class DigitsOnlyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digit characters from the input
    final String formattedValue = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Return the new value with the updated text
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}