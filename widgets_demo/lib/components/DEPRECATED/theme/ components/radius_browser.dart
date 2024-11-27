import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class RadiusBrowser extends StatelessWidget {
  const RadiusBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: SepteoColors.blue.shade300,
            borderRadius: BorderRadius.circular(SepteoSpacings.xs),
          ),
          child: Center(
            child: Text(
              "XS",
              style: SepteoTextStyles.bodySmallInter,
            ),
          ),
        ),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: SepteoColors.blue.shade300,
            borderRadius: BorderRadius.circular(SepteoSpacings.sm),
          ),
          child: Center(
            child: Text(
              "SM",
              style: SepteoTextStyles.bodySmallInter,
            ),
          ),
        ),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: SepteoColors.blue.shade300,
            borderRadius: BorderRadius.circular(SepteoSpacings.xl),
          ),
          child: Center(
            child: Text(
              "MD",
              style: SepteoTextStyles.bodySmallInter,
            ),
          ),
        ),
      ],
    );
  }
}
