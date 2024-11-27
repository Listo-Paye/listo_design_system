import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'color_row.dart';

class ColorsBrowser extends StatelessWidget {
  const ColorsBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ColorRow(color: SepteoColors.blue, title: "Primaire"),
        ColorRow(color: SepteoColors.orange, title: "Secondaire"),
        ColorRow(color: SepteoColors.grey, title: "Neutre"),
        ColorRow(color: SepteoColors.green, title: "Vert"),
        ColorRow(color: SepteoColors.yellow, title: "Jaune"),
        ColorRow(color: SepteoColors.red, title: "Rouge"),
        ColorRow(color: SepteoColors.purple, title: "Violet"),
      ],
    );
  }
}
