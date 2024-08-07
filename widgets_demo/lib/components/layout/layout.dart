import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'cards/cards.dart';
import 'scaffold/app_bar.dart';
import 'tabs/tabs.dart';
import 'theme/main_theme.dart';
import 'title_line/title_line.dart';

WidgetbookCategory layoutCategory(BuildContext context) {
  return WidgetbookCategory(name: "Layout", children: [
    mainTheme(context),
    scaffoldMolecule(context),
    titleLine(context),
    tabsMolecule(context),
    cardsMolecule(context),
  ]);
}
