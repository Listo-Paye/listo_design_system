import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/molecules/navigation_menu/destination_data.dart';

class NavigationMenuPresenter extends StatelessWidget {
  const NavigationMenuPresenter({super.key});

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
        ),
        child: NavigationMenu(
          body: Container(
            color: ListoMainColors.primary.ultraLight,
          ),
          destinations: [
            DestinationData(icon: Icons.home, label: "Accueil", action: () {}),
          ],
          showRail: true,
          showMenuIcon: true,
        ),
      ),
    );
  }
}
