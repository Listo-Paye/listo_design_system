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
            color: ListoMainColors.primary.medium,
            borderRadius: BorderRadius.circular(Radiuses.xs),
          ),
          child: Center(
            child: Text(
              "XS",
              style: TextStyles.bodyMedium,
            ),
          ),
        ),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: ListoMainColors.primary.medium,
            borderRadius: BorderRadius.circular(Radiuses.sm),
          ),
          child: Center(
            child: Text(
              "SM",
              style: TextStyles.bodyMedium,
            ),
          ),
        ),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: ListoMainColors.primary.medium,
            borderRadius: BorderRadius.circular(Radiuses.md),
          ),
          child: Center(
            child: Text(
              "MD",
              style: TextStyles.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
