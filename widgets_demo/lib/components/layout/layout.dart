import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/layout/tabs/tabs.dart';

import 'cards/cards.dart';
import 'scaffold/app_bar.dart';
import 'theme/main_theme.dart';

WidgetbookCategory layoutCategory(BuildContext context) {
  return WidgetbookCategory(name: "Layout", children: [
    cardsMolecule(context),
    scaffoldMolecule(context),
    tabsMolecule(context),
    mainTheme(context),
  ]);
}
