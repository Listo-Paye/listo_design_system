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
          label: "Modal title",
          initialValue: "Import fiche(s) Organisme Complémentaire",
        );
        var openModalButtonText = context.knobs.string(
          label: "Open modal button text",
          initialValue: "Importer",
        );
        var primaryButtonText = context.knobs.string(
          label: "Primary button text",
          initialValue: "Importer",
        );
        var secondaryButtonText = context.knobs.string(
          label: "Secondary button text",
          initialValue: "Annuler",
        );
        var uploadAreaMainText = context.knobs.string(
          label: "Upload main text",
          initialValue: "Ajouter une/plusieurs fiche(s)",
        );
        var uploadAreaSecondaryText = context.knobs.string(
          label: "Upload secondary text",
          initialValue: "ou glisser/déposer ici (format .xml uniquement)",
        );
        return SizedBox(
          height: 300,
          child: Center(
            child: UploadButton(
              onUpload: (files) {
                // ignore: avoid_print
                print("upload");
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
