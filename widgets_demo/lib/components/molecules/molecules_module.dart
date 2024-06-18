import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'app_bar.dart';

WidgetbookCategory getMoleculesCategory(BuildContext context) {
  return WidgetbookCategory(name: "Molecules", children: [
    appBarMolecule(context),
  ]);
}
