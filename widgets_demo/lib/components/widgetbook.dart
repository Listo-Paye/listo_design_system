import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/cards_v2/cards_v2.dart';

import 'charts/charts.dart';
import 'forms/forms.dart';
import 'indicators/indicators.dart';
import 'layout/layout.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    layoutCategory(context),
    formsCategory(context),
    indicatorsCategory(context),
    chartsCategory(context),
    cardsV2Category(context),
  ];
}
