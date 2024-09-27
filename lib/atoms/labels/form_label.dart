import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/labels/form_base_labels.dart';
import 'package:listo_design_system/listo_design_system.dart';

class FormLabel extends StatelessWidget {
  final String hint;
  final String? value;
  const FormLabel({
    super.key,
    required this.hint,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return FormBaseLabels(
      hint: hint,
      child: Text(
        value ?? '-',
        style: TextStyles.bodyLargeSemibold.copyWith(
          color: ListoMainColors.neutral.shade900,
        ),
      ),
    );
  }
}
