
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final formatter = NumberFormat.simpleCurrency(locale: "es_MX", decimalDigits: 0);

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    double value = double.parse(newValue.text);
    
    String newText = formatter.format(value );
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

String formatearIntACantidad(int value) {
  return formatter.format(value);  
}

int correctionPrice(String? value) {
  if (value == null) {
    return 0;
  }
  return int.parse(value
      .replaceAll('.00', '')
      .replaceAll(',', '')
      .replaceAll('\$', '')
      .trim());
}