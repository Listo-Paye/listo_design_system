import 'package:flutter/material.dart';
import 'package:listo_design_system/svg/septeo_logo.dart';

import '../../themes/colors.dart';
import '../../themes/spacing.dart';
import 'navigation_menu.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  Widget _logoOrMenuIcon(BuildContext context) {
    var menu = NavigationMenu.maybeOf(context);
    if (menu == null) {
      return septeoLogo;
    }
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: ListoMainColors.primary.ultraLight,
      splashFactory: InkSparkle.splashFactory,
      onTap: () {
        if (menu.isExpanded) {
          menu.closeMenu();
        } else {
          menu.openMenu();
        }
      },
      child: septeoLogo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Spacings.xs),
          child: Container(
            alignment: Alignment.centerLeft,
            child: _logoOrMenuIcon(context),
          ),
        ),
      ],
    );
  }
}
