import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent tabsMolecule(BuildContext context) {
  return WidgetbookComponent(name: "Tabs", useCases: [
    usercaseWithMarkdown(
      "TabsController",
      (context) => const SizedBox(
        height: 400,
        child: ListoTabsController(
          tabs: {
            "Accueil": Center(
              child: Text("Accueil"),
            ),
            "Paramètres": Center(
              child: Text("Paramètres"),
            )
          },
        ),
      ),
      "markdown/molecule_tabs_controller.md",
    ),
  ]);
}
