import 'package:flutter/material.dart';

import 'base_input_text.dart';

class TextArea extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  const TextArea({
    super.key,
    required this.hintText,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInputText(
      key: key ?? ValueKey('TextArea_$hintText'),
      hintText: hintText,
      initialValue: initialValue,
      onChanged: onChanged,
      maxLines: 4,
    );
  }
}
