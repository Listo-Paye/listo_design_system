import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import ' components/colors_browser.dart';
import ' components/radius_browser.dart';
import ' components/spacing_browser.dart';
import ' components/text_style.dart';

WidgetbookComponent mainTheme(BuildContext context) {
  return WidgetbookComponent(name: "Principal", useCases: [
    usercaseWithMarkdown(
      "ListoColors",
      (context) => const ColorsBrowser(),
      "markdown/theme_main_colors.md",
    ),
    usercaseWithMarkdown(
      "TexteStyles",
      (context) => const TypographyDocumentation(),
      "markdown/text_styles.md",
    ),
    usercaseWithMarkdown(
      'Radiuses',
      (context) => const RadiusBrowser(),
      "markdown/radius.md",
    ),
    usercaseWithMarkdown(
      'Spacings',
      (context) => const SpacingBrowser(),
      "markdown/spacings.md",
    ),
  ]);
}
