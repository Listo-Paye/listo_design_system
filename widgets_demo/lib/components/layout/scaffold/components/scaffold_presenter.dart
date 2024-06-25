import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class ScaffoldPresenter extends StatelessWidget {
  const ScaffoldPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    final email =
        context.knobs.string(label: "Email", initialValue: "john.doe@mail.com");
    final firstName =
        context.knobs.stringOrNull(label: "First name", initialValue: "John");
    final lastName =
        context.knobs.stringOrNull(label: "Last name", initialValue: "Doe");
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
        child: Scaffold(
          appBar: ListoAppBar(
            onMenuClick: () {
              NavigationMenu.of(context).toggleMenu();
            },
            email: email,
            firstName: firstName,
            lastName: lastName,
            onChangePassword: () {
              // Add your change password logic here
            },
            onLogout: () {
              // Add your logout logic here
            },
          ),
          body: NavigationMenu(
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
            showRail:
                context.knobs.boolean(label: "Show rail", initialValue: true),
            showMenuIcon: false,
          ),
        ),
      ),
    );
  }
}
