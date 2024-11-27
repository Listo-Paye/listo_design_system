import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'spacing_row.dart';

class SpacingBrowser extends StatelessWidget {
  const SpacingBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(SepteoSpacings.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacingRow(spacing: SepteoSpacings.xxxs, title: '2 px'),
          SpacingRow(spacing: SepteoSpacings.xxs, title: '4 px'),
          SpacingRow(spacing: SepteoSpacings.xs, title: '8 px'),
          SpacingRow(spacing: SepteoSpacings.sm, title: '12 px'),
          SpacingRow(spacing: SepteoSpacings.md, title: '16 px'),
          SpacingRow(spacing: SepteoSpacings.lg, title: '20 px'),
          SpacingRow(spacing: SepteoSpacings.xl, title: '24 px'),
          SpacingRow(spacing: SepteoSpacings.xxl, title: '32 px'),
          SpacingRow(spacing: SepteoSpacings.xxxl, title: '40 px'),
          SpacingRow(spacing: SepteoSpacings.xxxxl, title: '56 px'),
          SpacingRow(spacing: SepteoSpacings.xxxxxl, title: '80 px'),
        ],
      ),
    );
  }
}
