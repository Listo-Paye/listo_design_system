import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'scaffold/app_bar.dart';
import 'theme/main_theme.dart';

WidgetbookCategory layoutCategory(BuildContext context) {
  return WidgetbookCategory(name: "Layout", children: [
    scaffoldMolecule(context),
    mainTheme(context),
  ]);
}
