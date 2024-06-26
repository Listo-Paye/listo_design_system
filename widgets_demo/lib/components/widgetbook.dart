import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'forms/forms.dart';
import 'indicators/indicators.dart';
import 'layout/layout.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    layoutCategory(context),
    formsCategory(context),
    indicatorsCategory(context),
  ];
}
