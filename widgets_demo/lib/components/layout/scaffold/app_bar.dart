import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/listo_appbar_presenter.dart';

WidgetbookComponent scaffoldMolecule(BuildContext context) {
  return WidgetbookComponent(name: "Scaffold", useCases: [
    usercaseWithMarkdown(
      "AppBar",
      (context) => const ListoAppBarPresenter(),
      "markdown/molecule_app_bar.md",
    ),
  ]);
}
