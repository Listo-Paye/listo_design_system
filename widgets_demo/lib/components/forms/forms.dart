import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/saisie.dart';
import 'labels/components/all_in_one.dart';
import 'labels/labels.dart';
import 'tables_and_lists/tables_and_lists.dart';

WidgetbookCategory formsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Formulaires", children: [
    searchbarAtom(context),
    labelsMolecule(context),
    tablesAndListsMolecule(context),
    usercaseWithMarkdown(
      'Exemple',
      (context) => const AllInOne(),
      "markdown/molecule_form_axample.md",
    ),
  ]);
}
