import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent confirmationModalComponent(BuildContext context) {
  return WidgetbookComponent(
    name: "Modales",
    useCases: [
      usercaseWithMarkdown(
        "Confirmation Modal",
        (context) {
          return const ModalPresenter();
        },
        "markdown/confirmation_modal.md",
      ),
    ],
  );
}

class ModalPresenter extends StatefulWidget {
  const ModalPresenter({super.key});

  @override
  State<ModalPresenter> createState() => _ModalPresenterState();
}

class _ModalPresenterState extends State<ModalPresenter> {
  void _showModalWithLoader() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        bool isLoading = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ConfirmationModal(
              withLogo: true,
              title: "Modale avec loader",
              message:
                  "Cliquez sur 'Enregistrer' pour valider avec affichage d'un loader.",
              isLoading: isLoading,
              onValidate: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(dialogContext).pop();
                });
              },
              onCancel: () {
                Navigator.of(dialogContext).pop();
              },
            );
          },
        );
      },
    );
  }

  void _showModalWithoutLoader() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        bool isDisabled = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ConfirmationModal(
              withLogo: false,
              title: "Modale sans loader",
              message:
                  "Cliquez sur 'Enregistrer' pour valider sans affichage de loader",
              isDisabledCloseIcon: isDisabled,
              isDisabledCancelButton: isDisabled,
              isDisabledValidateButton: isDisabled,
              onValidate: () {
                setState(() {
                  isDisabled = true;
                });
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(dialogContext).pop();
                });
              },
              onCancel: () {
                Navigator.of(dialogContext).pop();
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showModalWithLoader,
              child: const Text("Modale avec loader"),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _showModalWithoutLoader,
              child: const Text("Modale sans loader"),
            ),
          ],
        ),
      ),
    );
  }
}
