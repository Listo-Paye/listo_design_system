import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/atoms_module.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../use_case_with_markdown.dart';

WidgetbookComponent popinAtom(BuildContext context) {
  return WidgetbookComponent(name: "Popin", useCases: [
    usercaseWithMarkdown(
      "Popin",
      (context) => const PopinPresenter(),
      "markdown/atome_popin.md",
    ),
  ]);
}

class PopinPresenter extends StatelessWidget {
  const PopinPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
        onPressed: () => showPopin(
              context: context,
              title: "Etes vous sur de rétablir la variable calculée ?",
              message:
                  "Rétablir la variable calculé entraine la suppression de la variable saisie. Elle ne sera plus accessible et sera remplacé par la variable calculé.",
              actionButtonText: "Rétablir",
              cancelButtonText: "Annuler",
              type: PopinType.info,
            ),
        text: "Afficher la popin");
  }
}
