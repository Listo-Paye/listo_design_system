import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/themes/theme_module.dart';

import 'atomes/atomes_module.dart';
import 'molecules/molecules_module.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    getThemesCategory(context),
    getAtomesCategory(context),
    getMoleculesCategory(context),
  ];
}
