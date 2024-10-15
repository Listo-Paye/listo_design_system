import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent uploadComponent(BuildContext context) {
  return WidgetbookComponent(name: "Upload", useCases: [
    usercaseWithMarkdown(
      "Modale d'upload",
      (context) {
        var modalTitle = context.knobs.string(
          label: "Titre de la modale",
          initialValue: "Import fiche(s) Organisme Complémentaire",
        );
        var openModalButtonText = context.knobs.string(
          label: "Texte du bouton d'ouverture de la modale",
          initialValue: "Importer",
        );
        var primaryButtonText = context.knobs.string(
          label: "Texte du bouton principal",
          initialValue: "Importer",
        );
        var secondaryButtonText = context.knobs.string(
          label: "Texte du bouton secondaire",
          initialValue: "Fermer",
        );
        var uploadAreaMainText = context.knobs.string(
          label: "Texte principale de la zone d'upload",
          initialValue: "Ajouter une/plusieurs fiche(s)",
        );
        var uploadAreaSecondaryText = context.knobs.string(
          label: "Texte secondaire de la zone d'upload",
          initialValue: "ou glisser/déposer ici (format .xml uniquement)",
        );

        var showProgress = context.knobs
            .boolean(label: "Afficher la progression", initialValue: false);

        final UploadController controller =
            UploadController(showProgress: showProgress);

        return SizedBox(
          height: 300,
          child: Center(
            child: UploadButton(
              controller: controller,
              onUpload: (files) {
                _simulateUpload(files, controller);
              },
              allowedExtensions: const [".xml", ".gif"],
              config: UploadConfig(
                modalTitle: modalTitle,
                openModalButtonText: openModalButtonText,
                primaryButtonText: primaryButtonText,
                secondaryButtonText: secondaryButtonText,
                uploadAreaMainText: uploadAreaMainText,
                uploadAreaSecondaryText: uploadAreaSecondaryText,
              ),
            ),
          ),
        );
      },
      "markdown/upload_files.md",
    ),
  ]);
}

void _simulateUpload(
    List<CustomFile> files, UploadController controller) {
  final randomFileIndex = Random().nextInt(files.length);
  for (int i = 0; i < files.length; i++) {
    final file = files[i];
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final progress = timer.tick / (5 * 10);
      if (progress >= 1) {
        timer.cancel();
        if (i == randomFileIndex) {
          controller.onError(
              file.name, "Le fichier contients des données invalides");
        } else {
          controller.onComplete(file.name);
        }
      } else {
        controller.onProgress(file.name, progress);
      }
    });
  }
}
