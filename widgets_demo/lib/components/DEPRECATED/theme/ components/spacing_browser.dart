import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'spacing_row.dart';

class SpacingBrowser extends StatelessWidget {
  const SpacingBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Spacings.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacingRow(spacing: Spacings.xs, title: 'Extra Small'),
          SpacingRow(spacing: Spacings.sm, title: 'Small'),
          SpacingRow(spacing: Spacings.md, title: 'Medium'),
          SpacingRow(spacing: Spacings.lg, title: 'Large'),
          SpacingRow(spacing: Spacings.xl, title: 'Extra Large'),
          SpacingRow(spacing: Spacings.xxl, title: 'Double Extra Large'),
          SpacingRow(spacing: Spacings.xxxl, title: 'Triple Extra Large'),
          SpacingRow(spacing: Spacings.xxxxl, title: 'Quadruple Extra Large'),
          SpacingRow(spacing: Spacings.xxxxxl, title: 'Quintuple Extra Large'),
        ],
      ),
    );
  }
}
