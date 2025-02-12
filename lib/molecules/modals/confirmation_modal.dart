import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ConfirmationModal extends StatelessWidget {
  final bool withLogo;
  final String title;
  final String body;
  final bool? isDisabledPrimaryButton;
  final bool? isDisabledSecondaryButton;
  final String? primaryButtonLabel;
  final String? secondaryButtonLabel;
  final VoidCallback onClose;
  final VoidCallback primaryButtonAction;
  final VoidCallback secondaryButtonAction;

  const ConfirmationModal({
    super.key,
    required this.withLogo,
    required this.title,
    required this.body,
    this.primaryButtonLabel,
    this.secondaryButtonLabel,
    this.isDisabledPrimaryButton,
    this.isDisabledSecondaryButton,
    required this.onClose,
    required this.primaryButtonAction,
    required this.secondaryButtonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 508, // Largeur fixe
        padding: const EdgeInsets.all(SepteoSpacings.xxl),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -10,
              right: -10,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  if (isDisabledPrimaryButton == false) {
                    Navigator.of(context).pop();
                    onClose();
                  }
                },
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: withLogo
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                if (withLogo) ...[
                  SizedBox(
                    height: 80,
                    child: Center(
                      child: speechBubbleLogo,
                    ),
                  ),
                  const SizedBox(height: SepteoSpacings.sm),
                ],
                Text(
                  title,
                  style: SepteoTextStyles.bodyLargeInterBold,
                  textAlign: withLogo ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: SepteoSpacings.lg),
                Text(
                  body,
                  style: SepteoTextStyles.bodyMediumInter
                      .copyWith(fontWeight: FontWeight.w400),
                  textAlign: withLogo ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: SepteoSpacings.lg),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        style: ButtonType.secondary,
                        text: secondaryButtonLabel ?? 'Annuler',
                        onPressed: () {
                          Navigator.of(context).pop();
                          secondaryButtonAction();
                        },
                        enabled: !(isDisabledSecondaryButton ?? false),
                      ),
                    ),
                    SizedBox(width: SepteoSpacings.sm),
                    Expanded(
                      child: Button(
                        style: ButtonType.primary,
                        text: primaryButtonLabel ?? 'Enregistrer',
                        onPressed: primaryButtonAction,
                        enabled: !(isDisabledPrimaryButton ?? false),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
