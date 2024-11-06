import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'cards/cards.dart';
import 'scaffold/app_bar.dart';
import 'theme/main_theme.dart';

WidgetbookCategory deprecatedCategory(BuildContext context) {
  return WidgetbookCategory(name: "[DEPRECATED]", children: [
    cardsDeprecated(context),
    navigationDeprecated(context),
    mainTheme(context),
  ]);
}
