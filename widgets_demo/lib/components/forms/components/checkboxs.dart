import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/forms/components/checkbox.dart';
import 'package:widgets_demo/components/forms/components/checkbox_with_text.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent checkbox(BuildContext context) {
  return WidgetbookComponent(
    name: "CheckBoxs",
    useCases: [
      usercaseWithMarkdown(
        "CheckBox",
        (context) {
          return const TriStateCheckboxDemo();
        },
        "markdown/checkbox.md",
      ),
      usercaseWithMarkdown(
        "CheckBoxWithText",
        (context) {
          return const CheckBoxWithTextPresenter();
        },
        "markdown/checkbox_with_text.md",
      ),
    ],
  );
}
