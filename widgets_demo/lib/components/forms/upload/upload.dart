import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent uploadComponent(BuildContext context) {
  return WidgetbookComponent(name: "Upload", useCases: [
    usercaseWithMarkdown(
      "Modale d'upload",
      (context) => const SizedBox(
        height: 300,
        child: Center(
          child: UploadButton(),
        ),
      ),
      "markdown/upload_files.md",
    ),
  ]);
}
