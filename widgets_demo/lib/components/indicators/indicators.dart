import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'alert.dart';
import 'progress_bar.dart';

WidgetbookCategory getIndicatorsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Atomes", children: [
    alertsAtom(context),
    progressBarAtom(context),
  ]);
}
