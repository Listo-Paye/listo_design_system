import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

import 'components/adaptive_md_presenter.dart';
import 'components/listo_appbar_presenter.dart';
import 'components/navigation_menu_presenter.dart';
import 'components/scaffold_presenter.dart';

WidgetbookComponent navigationDeprecated(BuildContext context) {
  return WidgetbookComponent(name: "Navigation V1", useCases: [
    usercaseWithMarkdown(
      "ListoAppBar",
      (context) => const ListoAppBarPresenter(),
      "markdown/molecule_app_bar.md",
    ),
    usercaseWithMarkdown(
      "NavigationMenu",
      (context) => const NavigationMenuPresenter(),
      "markdown/navigation_menu.md",
    ),
    usercaseWithMarkdown(
      "Scaffold",
      (context) => const ScaffoldPresenter(),
      "markdown/scaffold_guide.md",
    ),
    usercaseWithMarkdown(
      "AdaptiveNavigation",
      (context) => const AdaptiveMdPresenter(),
      "markdown/adaptive_master_detail.md",
    ),
  ]);
}
