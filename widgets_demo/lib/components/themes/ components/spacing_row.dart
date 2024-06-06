import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class SpacingRow extends StatelessWidget {
  final double spacing;
  final String title;

  const SpacingRow({
    super.key,
    required this.spacing,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacings.xs),
      child: Row(
        children: [
          Container(
            height: 20,
            width: spacing,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 20),
          Text(title, style: TextStyles.bodyMedium),
        ],
      ),
    );
  }
}
