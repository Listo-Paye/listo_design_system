import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ListoTabsController extends StatelessWidget {
  final Map<String, Widget> tabs;

  const ListoTabsController({
    super.key,
    required this.tabs,
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
                unselectedLabelStyle: SepteoTextStyles.bodyMediumInter
                    .copyWith(color: SepteoColors.grey.shade500),
                labelStyle: SepteoTextStyles.bodyMediumInterBold
                    ,
                dividerColor: Colors.transparent,
                indicatorColor: SepteoColors.blue.shade900,
                isScrollable: true,
                tabs: tabs.keys
                    .map((key) => Tab(
                          text: key,
                        ))
                    .toList()),
          ),
          Expanded(
            child: TabBarView(
              children: tabs.values.toList(),
            ),
          ),
        ],
      ),
    );
  }
}
