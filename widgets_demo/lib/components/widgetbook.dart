import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/tables_and_lists/tables_and_lists.dart';

import 'forms/forms.dart';
import 'indicators/indicators.dart';
import 'layout/layout.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    layoutCategory(context),
    formsCategory(context),
    indicatorsCategory(context),
    tablesAndListsCategory(context),
  ];
}
