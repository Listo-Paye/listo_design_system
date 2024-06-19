import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'alert.dart';
import 'progress_bar.dart';

WidgetbookCategory indicatorsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Indicateurs", children: [
    alertsAtom(context),
    progressBarAtom(context),
  ]);
}
