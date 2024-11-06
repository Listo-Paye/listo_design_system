import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'color_row.dart';

class ColorsBrowser extends StatelessWidget {
  const ColorsBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ColorRow(color: ListoMainColors.primary, title: "Primaire"),
        ColorRow(color: ListoMainColors.secondary, title: "Secondaire"),
        ColorRow(color: ListoMainColors.neutral, title: "Neutre"),
        ColorRow(color: ListoMainColors.success, title: "Succès"),
        ColorRow(color: ListoMainColors.warning, title: "Attention"),
        ColorRow(color: ListoMainColors.error, title: "Erreur"),
        ColorRow(color: ListoMainColors.info, title: "Info"),
      ],
    );
  }
}
