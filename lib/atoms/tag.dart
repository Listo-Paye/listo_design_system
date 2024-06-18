import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/themes/spacing.dart';
import 'package:listo_design_system/themes/themes_module.dart';
import '../themes/text_style.dart';

class Tag extends StatelessWidget {
  final MaterialColor backgroundColor;
  final MaterialColor textColor;
  final String label;
  const Tag({super.key, required this.backgroundColor, required this.textColor, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.sm, vertical: Spacings.xs),
        decoration: BoxDecoration(
          color: backgroundColor[200],
          borderRadius: const BorderRadius.all(Radius.circular(Radiuses.md)),
        ),
        child: Text(label, style: TextStyles.bodyMedium.copyWith(color: textColor[800]))
    );
  }
}