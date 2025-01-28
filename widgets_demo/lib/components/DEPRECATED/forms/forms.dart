import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/button_presenter.dart';

WidgetbookComponent formsDeprecated(BuildContext context) {
  return WidgetbookComponent(name: "Forms", useCases: [
    usercaseWithMarkdown(
      "Button",
      (context) => const ButtonPresenter(),
      "markdown/atome_button.md",
    ),
  ]);
}