import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/themes/colors.dart';
import 'package:listo_design_system/themes/spacing.dart';
import 'package:listo_design_system/themes/themes_module.dart';
import '../themes/text_style.dart';


class TagTypes {
  final Color backgroundColor;
  final Color textColor;

  TagTypes(this.backgroundColor, this.textColor);

  static get defaultType => TagTypes(ListoMainColors.neutral[100]!, ListoMainColors.neutral[700]!);
  static get ghost => TagTypes(Colors.white, ListoMainColors.neutral[900]!);
  static get success => TagTypes(ListoMainColors.success.light, ListoMainColors.success.darker);
  static get info => TagTypes(ListoMainColors.info.light, ListoMainColors.info.darker);
  static get danger => TagTypes(ListoMainColors.error.medium, ListoMainColors.error.ultraLight);
  static get warning => TagTypes(ListoMainColors.secondary.light, ListoMainColors.secondary.base);
}

class Tag extends StatelessWidget {
  final TagTypes type;
  final String label;
  const Tag({super.key, required this.type, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.sm, vertical: Spacings.xs),
        decoration: BoxDecoration(
          color: type.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(Radiuses.md)),
        ),
        child: Text(label, style: TextStyles.bodyMedium.copyWith(color: type.textColor))
    );
  }
}