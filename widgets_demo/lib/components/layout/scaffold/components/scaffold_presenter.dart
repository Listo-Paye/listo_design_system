import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class PresenterScaffold extends StatefulWidget {
  final Widget child;
  const PresenterScaffold({super.key, required this.child});

  @override
  State<PresenterScaffold> createState() => _PresenterScaffoldState();
}

class _PresenterScaffoldState extends State<PresenterScaffold> {
  String selectedTab = "Salariés";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(
            color: ListoDesignSystem.themes.main.primaryColor,
            width: 3,
          ),
        ),
        child: Scaffold(
          appBar: LogoAppBar(
            actions: [],
            title: NavigationTabs(
              selectedTab: selectedTab,
              tabs: ["Salariés", "Entreprise"],
              onTabSelected: (tab) {
                setState(() {
                  selectedTab = tab;
                });
              },
            ),
            endActions: [
              Profil(
                label: "admin",
                onHelp: () {},
                onLogout: () {},
                email: 'john.doe@septeo.com',
              ),
            ],
            logo: AssetImage('assets/images/logo.png'),
          ),
          body: Container(
            color: SepteoColors.blue.shade50,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
