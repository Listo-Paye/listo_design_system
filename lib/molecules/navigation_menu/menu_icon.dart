import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
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
      splashColor: SepteoColors.blue.shade50,
      splashFactory: InkSparkle.splashFactory,
      onTap: () {
        menu.toggleMenu();
      },
      child: septeoLogo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: SepteoSpacings.xs),
          child: Container(
            alignment: Alignment.centerLeft,
            child: _logoOrMenuIcon(context),
          ),
        ),
      ],
    );
  }
}
