import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/colors.dart';
import '../../themes/spacing.dart';

class BaseInputText extends StatelessWidget {
  final String hintText;
  final List<TextInputFormatter> formatters;
  final InputDecoration decoration;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool enabled;
  late final TextEditingController controller;
  BaseInputText({
    super.key,
    this.hintText = '',
    String? initialValue,
    this.onChanged,
    this.formatters = const [],
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.maxLines,
    this.enabled = true,
  }) {
    controller = TextEditingController(text: initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ListoMainColors.primary.ultraLight,
      child: TextField(
        enabled: enabled,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: decoration.copyWith(
          labelText: hintText,
          alignLabelWithHint: maxLines != null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Spacings.sm,
            vertical: Spacings.xs,
          ),
        ),
        textAlignVertical: (maxLines != null) ? TextAlignVertical.top : null,
        inputFormatters: [...formatters],
        controller: controller,
        onChanged: (_) {
          onChanged?.call(controller.text);
        },
      ),
    );
  }
}
