import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'cards/cards.dart';
import 'scaffold/app_bar.dart';

WidgetbookCategory deprecatedCategory(BuildContext context) {
  return WidgetbookCategory(name: "[DEPRECATED]", children: [
    cardsDeprecated(context),
    navigationDeprecated(context),
  ]);
}
