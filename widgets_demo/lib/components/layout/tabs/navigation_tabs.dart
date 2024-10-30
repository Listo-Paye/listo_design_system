import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent navigationTabsMolecule(BuildContext context) {
  return WidgetbookComponent(name: "Navigation Tabs", useCases: [
    usercaseWithMarkdown(
      "NavigationTabs",
          (context) => const NavigationTabsPresenter(),
      "markdown/molecule_tabs_controller.md",
    ),
  ]);
}

class NavigationTabsPresenter extends StatefulWidget {
  const NavigationTabsPresenter({super.key});

  @override
  State<NavigationTabsPresenter> createState() => _NavigationTabsPresenterState();
}

class _NavigationTabsPresenterState extends State<NavigationTabsPresenter> {
  String selectedTab = "Salariés";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: NavigationTabs(
        selectedTab: selectedTab,
        tabs: const ["Salariés", "Etablissement"],
        // ignore: avoid_print
        onTabSelected: (tab) => setState(() => selectedTab = tab),
      ),
    );
  }
}