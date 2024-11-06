import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/contracts_presenter.dart';
import 'components/dashboard_presenter.dart';
import 'components/logo_app_bar_presenter.dart';

WidgetbookComponent scaffoldMolecule(BuildContext context) {
  return WidgetbookComponent(name: "Global Layout", useCases: [
    usercaseWithMarkdown(
      "App Bar",
      (context) => const LogoAppBarPresenter(),
      "markdown/logo_app_bar.md",
    ),
    usercaseWithMarkdown(
      "Adaptive Scaffold",
      (context) => const DashboardPresenter(),
      "markdown/dashboard.md",
    ),
    usercaseWithMarkdown(
      "Contracts Selector",
      (context) => const ContractsSelectorPresenter(),
      "markdown/contracts_selector.md",
    ),
  ]);
}
