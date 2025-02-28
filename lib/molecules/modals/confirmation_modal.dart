import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ConfirmationModal extends StatelessWidget {
  final bool withLogo;

  final String title;
  final String message;
  final bool isLoading;
  final VoidCallback onValidate;
  final VoidCallback onCancel;
  final String? loadingTitle;
  final String? loadingMessage;
  final String? validateButtonLabel;
  final String? cancelButtonLabel;
  final bool? isDisabledValidateButton;
  final bool? isDisabledCancelButton;
  final bool? isDisabledCloseIcon;

  const ConfirmationModal({
    super.key,
    required this.withLogo,
    required this.title,
    required this.message,
    required this.onValidate,
    required this.onCancel,
    this.validateButtonLabel,
    this.cancelButtonLabel,
    this.isDisabledValidateButton,
    this.isDisabledCancelButton,
    this.isDisabledCloseIcon,
    this.isLoading = false,
    this.loadingTitle,
    this.loadingMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 508,
        padding: const EdgeInsets.all(SepteoSpacings.xxl),
        child: isLoading
            ? _buildLoadingContent(context)
            : _buildConfirmationContent(context),
      ),
    );
  }

  Widget _buildConfirmationContent(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -10,
          right: -10,
          child: IconButton(
            key: Key('${runtimeType}_closeIcon'),
            icon: const Icon(Icons.close),
            onPressed: () {
              if (!(isDisabledCloseIcon ?? false)) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              withLogo ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
              message,
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
                    text: cancelButtonLabel ?? 'Annuler',
                    onPressed: onCancel,
                    enabled: !(isDisabledCancelButton ?? false),
                  ),
                ),
                const SizedBox(width: SepteoSpacings.sm),
                Expanded(
                  child: Button(
                    style: ButtonType.primary,
                    text: validateButtonLabel ?? 'Enregistrer',
                    onPressed: onValidate,
                    enabled: !(isDisabledValidateButton ?? false),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    final effectiveLoadingTitle = loadingTitle ?? 'En cours...';
    final effectiveLoadingMessage = loadingMessage ?? 'Veuillez patienter';

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          color: Colors.orange,
        ),
        const SizedBox(height: SepteoSpacings.lg),
        Text(
          effectiveLoadingTitle,
          style: SepteoTextStyles.bodyLargeInterBold,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: SepteoSpacings.lg),
        Text(
          effectiveLoadingMessage,
          style: SepteoTextStyles.bodyMediumInter
              .copyWith(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
