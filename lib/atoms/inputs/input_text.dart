import 'package:flutter/material.dart';

import 'base_input_text.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final bool enabled;
  final void Function(String)? onChanged;
  const InputText({
    super.key,
    required this.hintText,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputText(
      key: ValueKey('InputText_$hintText'),
      enabled: enabled,
      hintText: hintText,
      initialValue: initialValue,
      onChanged: onChanged,
    );
  }
}
