import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import './table/listo_data_table.dart';

WidgetbookCategory moleculesCategory(BuildContext context) {
  return WidgetbookCategory(name: "Molécules", children: [
    ListoDataTableMolecule(context),
  ]);
}
