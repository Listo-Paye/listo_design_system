import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

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
          onSettings: () {
            // ignore: avoid_print
            print("Settings");
          },
          body: Container(
            color: ListoMainColors.primary.ultraLight,
          ),
          destinations: [
            DestinationData(icon: Icons.grid_view, label: "Tableau de bord"),
            DestinationData(icon: Icons.person, label: "Employés"),
            DestinationData(icon: Icons.content_paste, label: "Contrats"),
            DestinationData(
              icon: Icons.insert_chart_outlined,
              label: "Variables",
              children: [
                DestinationData(
                  icon: Icons.radar,
                  label: "Radar",
                ),
              ],
            ),
            DestinationData(icon: Icons.euro, label: "Bulletins de paie"),
            DestinationData(
              icon: Icons.emoji_flags,
              label: "Périodes clôturées",
            ),
          ],
          showRail: true,
          showMenuIcon: true,
        ),
      ),
    );
  }
}
