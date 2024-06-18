import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent navigationRailMolecule(BuildContext context) {
  return WidgetbookComponent(
    name: 'Navigation Rail',
    useCases: [
      usercaseWithMarkdown(
          'Navigation Rail',
          (context) => const NavigationRailPresenter(),
          "markdown/navigation_rail.md")
    ],
  );
}

class NavigationRailPresenter extends StatelessWidget {
  const NavigationRailPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          border: Border.all(
            color: ListoDesignSystem.themes.main.primaryColor,
            width: 3,
          ),
          color: ListoMainColors.primary.base,
        ),
        child: ListoNavigationRail(
          destinationData: [
            DestinationData(
              icon: Icons.home,
              label: 'Home',
            ),
            DestinationData(
              icon: Icons.add_chart,
              label: 'Charts',
            ),
            DestinationData(
              icon: Icons.area_chart,
              label: 'Area',
            ),
            DestinationData(
              icon: Icons.bar_chart,
              label: 'Bar',
            ),
          ],
        ),
      ),
    );
    return const ListoNavigationRail(
      destinationData: [],
    );
  }
}