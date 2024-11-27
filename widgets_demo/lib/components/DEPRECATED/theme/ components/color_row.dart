import 'package:flutter/material.dart';

import 'color_container.dart';

class ColorRow extends StatelessWidget {
  final String title;
  final ColorSwatch color;

  const ColorRow({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, Color> colors = {};
    colors.addEntries({
      "900": color[900]!,
      "800": color[800]!,
      "700": color[700]!,
      "600": color[600]!,
      "500": color[500]!,
      "400": color[400]!,
      "300": color[300]!,
      "200": color[200]!,
      "100": color[100]!,
      "50": color[50]!,
    }.entries);
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var color in colors.entries) ...[
              ColorContainer(
                color: color.value,
                name: color.key,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
