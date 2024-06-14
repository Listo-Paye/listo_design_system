import 'package:flutter/material.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:listo_design_system/molecules/listo_navigation_rail.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';


WidgetbookComponent navigationRailMolecule(BuildContext context) {
  return WidgetbookComponent(
    name: 'Navigation Rail',
    useCases: [
        usercaseWithMarkdown('Navigation Rail', (context) => const NavigationRailPresenter(), "markdown/navigation_rail.md")
    ],
  );
}

class NavigationRailPresenter extends StatelessWidget {
  const NavigationRailPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListoNavigationRail(destinationData: [],);
  }
}