import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/molecules/app_bar/icon_change.dart';

class SelectionButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final FutureOr<void> Function()? onPressed;
  const SelectionButton({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var canChange = onPressed != null;
    return SizedBox(
      height: 48,
      child: FilledButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.hovered)) {
                return ListoMainColors.primary.light;
              }
              return Colors.white;
            },
          ),
          foregroundColor: WidgetStateProperty.all(
            ListoMainColors.neutral.shade900,
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: ListoMainColors.neutral.shade400,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Spacings.xs),
            ),
          ),
        ),
        icon: canChange ? iconChange : null,
        label: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyles.headingMediumSemibold),
            Text(subtitle, style: TextStyles.bodySmall),
          ],
        ),
      ),
    );
  }
}
