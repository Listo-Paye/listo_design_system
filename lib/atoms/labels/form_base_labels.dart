import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class FormBaseLabels extends StatelessWidget {
  final String hint;
  final Widget child;
  const FormBaseLabels({
    super.key,
    required this.hint,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          hint,
          style: TextStyles.bodySmall.copyWith(
            color: ListoMainColors.neutral.shade500,
          ),
        ),
        child,
      ],
    );
  }
}
