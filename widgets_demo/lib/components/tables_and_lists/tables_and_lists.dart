import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../tables_and_lists/listo_data_table.dart';

WidgetbookCategory tablesAndListsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Tables et Listes", children: [
    listoDataTableMolecule(context),
  ]);
}
