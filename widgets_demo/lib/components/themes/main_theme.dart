import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import ' components/colors_browser.dart';

WidgetbookComponent mainTheme(BuildContext context) {
  return WidgetbookComponent(name: "Principal", useCases: [
    usercaseWithMarkdown(
      "Couleurs",
      (context) => const ColorsBrowser(),
      "markdown/theme_main_colors.md",
    ),
  ]);
}
