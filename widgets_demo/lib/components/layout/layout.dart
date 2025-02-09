import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/DEPRECATED/deprecated.dart';

import 'scaffold/app_bar.dart';
import 'tabs/navigation_tabs.dart';
import 'tabs/tabs.dart';
import 'title_line/title_line.dart';

WidgetbookCategory layoutCategory(BuildContext context) {
  return WidgetbookCategory(name: "Layout", children: [
    scaffoldMolecule(context),
    titleLine(context),
    tabsMolecule(context),
    navigationTabsMolecule(context),
    deprecatedCategory(context),
  ]);
}
