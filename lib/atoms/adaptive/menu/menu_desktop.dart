import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:septeo_design_system/septeo_design_system.dart';

import 'menu_item.dart';

class MenuDesktop extends StatelessWidget {
  final String title;
  final List<MenuElement> items;
  final String? selectedRoute;
  const MenuDesktop({
    super.key,
    required this.title,
    required this.items,
    this.selectedRoute,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    list.add(Text(
      title,
      style: SepteoTextStyles.bodySmallInterBold,
    ));
    for (var item in items) {
      if (item.route == selectedRoute) {
        list.add(MenuElement(
          title: item.title,
          route: item.route,
          selected: true,
          onSelect: item.onSelect,
        ));
      } else {
        list.add(MenuElement(
          title: item.title,
          route: item.route,
          onSelect: item.onSelect,
        ));
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SepteoSpacings.xs),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          SepteoSpacings.xs,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => list[index].animate().fade(
                delay: Duration(
                  milliseconds: index * 100,
                ),
              ),
          separatorBuilder: (_, __) => SizedBox(
            height: SepteoSpacings.md,
          ),
          itemCount: list.length,
        ).animate().fade(duration: 100.ms),
      ),
    );
  }
}
