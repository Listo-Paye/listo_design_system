import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'alert.dart';
import 'button.dart';

WidgetbookCategory getAtomesCategory(BuildContext context) {
  return WidgetbookCategory(name: "Atomes", children: [
    buttonsAtom(context),
    alertsAtom(context),
  ]);
}
