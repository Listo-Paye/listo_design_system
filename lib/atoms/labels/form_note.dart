import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class FormNote extends StatelessWidget {
  final String label;
  final String value;
  const FormNote({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0FF),
        borderRadius: BorderRadius.circular(0),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(Spacings.xs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyles.bodySmall.copyWith(
                color: ListoMainColors.primary.base,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value,
              style: TextStyles.bodyMedium.copyWith(
                color: ListoMainColors.neutral.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
