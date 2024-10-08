import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/atoms/labels/form_base_labels.dart';
import 'package:listo_design_system/listo_design_system.dart';

class FormPeriodLabel extends StatelessWidget {
  final String hint;
  final DateTime startDate;
  final DateTime? endDate;

  const FormPeriodLabel({
    super.key,
    required this.hint,
    required this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text(
        DateFormat('dd/MM/yyyy').format(startDate),
        style: TextStyles.bodyLargeSemibold.copyWith(
          color: ListoMainColors.neutral.shade900,
        ),
      ),
    ];

    if (endDate != null) {
      children.addAll([
        const SizedBox(width: Spacings.xs),
        Text(
          '->',
          style: TextStyles.bodyLargeSemibold.copyWith(
            color: ListoMainColors.neutral.shade900,
          ),
        ),
        const SizedBox(width: Spacings.xs),
        Text(
          DateFormat('dd/MM/yyyy').format(endDate!),
          style: TextStyles.bodyLargeSemibold.copyWith(
            color: ListoMainColors.neutral.shade900,
          ),
        ),
      ]);
    }

    return FormBaseLabels(
      hint: hint,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}