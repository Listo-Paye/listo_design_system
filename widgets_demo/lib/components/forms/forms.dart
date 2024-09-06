import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components/button.dart';
import 'components/searchbar.dart';
import 'labels/labels.dart';
import 'tables_and_lists/tables_and_lists.dart';

WidgetbookCategory formsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Formulaires", children: [
    searchbarAtom(context),
    labelsMolecule(context),
    buttonsAtom(context),
    tablesAndListsMolecule(context),
  ]);
}
