import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/atomes/progress_bar.dart';

import 'alert.dart';
import 'button.dart';

WidgetbookCategory getAtomesCategory(BuildContext context) {
  return WidgetbookCategory(name: "Atomes", children: [
    buttonsAtom(context),
    alertsAtom(context),
    progressBarAtom(context),
  ]);
}
