import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/components/forms/affiliation_oc/presenter/affiliation_oc.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent affiliationOc(BuildContext context) {
  return WidgetbookComponent(
    name: "Affiliation organisme complémentaire",
    useCases: [
      usercaseWithMarkdown(
        "Formulaire d'affiliation",
        (context) {
          return const GestionAffiliationsFormPresenter();
        },
        "markdown/checkbox.md",
      ),
    ],
  );
}
