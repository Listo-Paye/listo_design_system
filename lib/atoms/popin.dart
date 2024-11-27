import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum PopinType {
  info,
  danger,
}

void showPopin({
  required BuildContext context,
  required String title,
  required String message,
  required String actionButtonText,
  required String cancelButtonText,
  PopinType type = PopinType.info,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => Popin(
      title: title,
      message: message,
      actionButtonText: actionButtonText,
      cancelButtonText: cancelButtonText,
      type: type,
    ),
  );
}

class Popin extends StatelessWidget {
  final PopinType type;
  final String title;
  final String message;
  final String actionButtonText;
  final String cancelButtonText;

  const Popin({
    super.key,
    required this.title,
    required this.message,
    required this.actionButtonText,
    required this.cancelButtonText,
    this.type = PopinType.info,
  });

  Color get _primaryColor {
    return switch (type) {
      PopinType.info => SepteoColors.blue.shade900,
      PopinType.danger => SepteoColors.red.shade300,
    };
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SepteoSpacings.sm),
      ),
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.fromLTRB(
        SepteoSpacings.xxl,
        SepteoSpacings.xxl,
        SepteoSpacings.xxl,
        SepteoSpacings.md,
      ),
      content: SizedBox(
        width: 450,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_outline,
              size: 72,
            ),
            const SizedBox(height: SepteoSpacings.md),
            Text(
              title,
              style: SepteoTextStyles.bodyLargeInterBold,
            ),
            const SizedBox(height: SepteoSpacings.md),
            Text(
              message,
              style: SepteoTextStyles.bodyMediumInter,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Button(
                style: ButtonType.secondary,
                text: cancelButtonText,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(width: SepteoSpacings.xs),
            Expanded(
              child: FilledButton(
                style: ButtonStyles.primary.copyWith(
                  backgroundColor: WidgetStateProperty.all(_primaryColor),
                ),
                child: Text(actionButtonText),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
