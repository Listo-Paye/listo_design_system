import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/amount_title_presenter.dart';
import 'components/title_label_presenter.dart';
import 'components/va_tag_presenter.dart';

WidgetbookComponent labelsMolecule(BuildContext context) {
  return WidgetbookComponent(
    name: 'Libellés',
    useCases: [
      usercaseWithMarkdown(
          'FormTitle',
          (context) => const TitleLabelPresenter(),
          "markdown/molecule_labels.md"),
      usercaseWithMarkdown(
        'AmountTitle',
        (context) => const AmountTitlePresenter(),
        "markdown/molecule_labels.md",
      ),
      usercaseWithMarkdown(
        'VaTag',
        (context) => const VaTagPresenter(),
        "markdown/molecule_labels.md",
      ),
    ],
  );
}
