import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ListoTabsController extends StatelessWidget {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];
  const ListoTabsController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              unselectedLabelStyle: TextStyles.bodyLarge
                  .copyWith(color: ListoMainColors.neutral[500]),
              labelStyle: TextStyles.bodyLargeSemibold
                  .copyWith(color: ListoMainColors.primary),
              dividerColor: Colors.transparent,
              indicatorColor: ListoMainColors.primary,
              isScrollable: true,
              tabs: const <Widget>[
                Tab(text: 'Absences'),
                Tab(
                  text: 'Planning',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: myTabs.map((Tab tab) {
                final String label = tab.text!.toLowerCase();
                return Center(
                  child: Text(
                    'This is the $label tab',
                    style: const TextStyle(fontSize: 36),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
