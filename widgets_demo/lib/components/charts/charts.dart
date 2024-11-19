import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/charts/presenters/container.dart';

import 'presenters/pie.dart';

WidgetbookCategory chartsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Charts", children: [
    containerChart(context),
    pieChart(context),
  ]);
}
