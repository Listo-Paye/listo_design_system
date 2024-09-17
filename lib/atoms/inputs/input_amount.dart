import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/colors.dart';
import 'base_input_text.dart';

class InputAmount extends StatelessWidget {
  final String hintText;
  final double? initialValue;
  final bool enabled;
  final void Function(double?)? onChanged;

  const InputAmount({
    super.key,
    required this.hintText,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputText(
      key: ValueKey('InputAmount_$hintText'),
      enabled: enabled,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      hintText: hintText,
      initialValue: initialValue?.toString().replaceAll(".", ","),
      formatters: [AmountFormatter()],
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.euro),
        prefixIconColor: ListoMainColors.primary.base,
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          onChanged?.call(null);
        } else {
          onChanged?.call(double.parse(value.replaceAll(",", ".")));
        }
      },
    );
  }
}

class AmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || newValue.text == oldValue.text) {
      return newValue;
    }
    var text = newValue.text.replaceAll(".", ",");
    if (text.contains(",")) {
      var parts = text.split(",");
      if (parts.length > 2) {
        return oldValue;
      }
      if (parts[1].length > 2) {
        return oldValue;
      }
    }
    var value = double.tryParse(newValue.text.replaceAll(",", "."));
    if (value == null) {
      return oldValue;
    }
    return newValue.copyWith(text: newValue.text.replaceAll(".", ","));
  }
}
