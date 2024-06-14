import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'app_bar.dart';
import 'listo_navigation_rail/listo_navigation_rail.dart';

WidgetbookCategory getMoleculesCategory(BuildContext context) {
  return WidgetbookCategory(name: "Molecules", children: [
    appBarMolecule(context),
    navigationRailMolecule(context),
  ]);
}
