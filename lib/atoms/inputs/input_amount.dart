import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../themes/colors.dart';
import 'base_input_text.dart';

class InputAmount extends StatelessWidget {
  final String hintText;
  final double? initialValue;
  final void Function(double?)? onChanged;

  const InputAmount({
    super.key,
    required this.hintText,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputText(
      key: key ?? ValueKey('InputAmount_$hintText'),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      hintText: hintText,
      initialValue: (initialValue == null)
          ? null
          : AmountFormatter.formatter.format(initialValue),
      formatters: [AmountFormatter()],
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.euro),
        prefixIconColor: ListoMainColors.primary.base,
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          onChanged?.call(null);
        } else {
          onChanged?.call(AmountFormatter.formatter.parse(value));
        }
      },
    );
  }
}

class AmountFormatter extends TextInputFormatter {
  static get formatter => NumberFormat.decimalPatternDigits(
        locale: 'fr_FR',
        decimalDigits: 2,
      );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    var value = formatter.tryParse(newValue.text)?.toDouble();
    if (value == null) {
      return oldValue;
    }
    return newValue.copyWith(
      text: formatter.format(value),
    );
  }
}
