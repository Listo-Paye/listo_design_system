import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'presenters/pie.dart';

WidgetbookCategory chartsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Charts", children: [
    pieChart(context),
  ]);
}
