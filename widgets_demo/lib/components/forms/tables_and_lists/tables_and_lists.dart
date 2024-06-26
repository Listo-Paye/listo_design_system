import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/listo_data_table_presenter.dart';

WidgetbookComponent tablesAndListsMolecule(BuildContext context) {
  return WidgetbookComponent(
    name: 'Tables et listes',
    useCases: [
      usercaseWithMarkdown(
          'DataTable',
              (context) => const ListoDataTablePresenter(),
          "markdown/molecule_data_table.md"),
    ],
  );
}