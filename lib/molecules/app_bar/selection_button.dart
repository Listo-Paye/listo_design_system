import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listo_design_system/listo_design_system.dart';

class SelectionButton extends StatefulWidget {
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
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late bool canChange = false;
  late bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: FilledButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.only(right: SepteoSpacings.md),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.hovered)) {
                return SepteoColors.blue.shade200;
              }
              return (widget.onPressed != null)
                  ? Colors.white
                  : SepteoColors.blue.shade50;
            },
          ),
          foregroundColor: WidgetStateProperty.all(
            SepteoColors.grey.shade900,
          ),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return BorderSide(
                color: SepteoColors.orange.shade600,
              );
            }
            if (states.contains(WidgetState.hovered)) {
              return BorderSide(
                color: SepteoColors.blue.shade200,
              );
            }
            return BorderSide(
              color: SepteoColors.grey.shade400,
            );
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SepteoSpacings.xs),
            ),
          ),
        ),
        onHover: (hover) {
          setState(() {
            canChange = hover && widget.onPressed != null;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width: 30,
                  child: Center(
                    child: canChange
                        ? IconChange().animate().fade().scale()
                        : null,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: SepteoTextStyles.bodyLargeInterBold),
                  Text(widget.subtitle, style: SepteoTextStyles.captionInter),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
