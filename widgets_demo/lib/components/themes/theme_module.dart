import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/themes/main_theme.dart';

WidgetbookCategory getThemesCategory(BuildContext context) {
  return WidgetbookCategory(name: "Themes", children: [
    mainTheme(context),
  ]);
}
