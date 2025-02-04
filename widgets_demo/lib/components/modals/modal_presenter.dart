import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/modals/modal.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../use_case_with_markdown.dart';

WidgetbookComponent confirmationModalComponent(BuildContext context) {
  return WidgetbookComponent(
    name: "Modals",
    useCases: [
      usercaseWithMarkdown(
        "Custom Modal",
        (context) {
          return const ModalPresenter();
        },
        "markdown/modal.md",
      ),
    ],
  );
}

class ModalPresenter extends StatefulWidget {
  const ModalPresenter({Key? key}) : super(key: key);

  @override
  State<ModalPresenter> createState() => _ModalPresenterState();
}

class _ModalPresenterState extends State<ModalPresenter> {
  void _showCustomModal({required bool withLogo}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return CustomModal(
          withLogo: withLogo,
          title: withLogo ? "Modale avec logo" : "Modale sans logo",
          body: "Voici le texte explicatif de la modale.",
          onClose: () {
            Navigator.of(dialogContext).pop();
          },
          secondaryButtonAction: () {
            Navigator.of(dialogContext).pop();
          },
          primaryButtonAction: () {
            Navigator.of(dialogContext).pop();
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
              onPressed: () => _showCustomModal(withLogo: true),
              child: const Text("Afficher modale avec logo"),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => _showCustomModal(withLogo: false),
              child: const Text("Afficher modale sans logo"),
            ),
          ],
        ),
      ),
    );
  }
}
