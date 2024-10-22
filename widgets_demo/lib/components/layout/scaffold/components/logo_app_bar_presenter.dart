import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class LogoAppBarPresenter extends StatelessWidget {
  const LogoAppBarPresenter({super.key});

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
        child: PresenterScaffold(),
      ),
    );
  }
}

class PresenterScaffold extends StatelessWidget {
  const PresenterScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(
        actions: [
          SelectionButton(
            title: context.knobs.string(
              label: "Titre",
              initialValue: "Ma cabane en bois",
            ),
            subtitle: context.knobs.string(
              label: "Sous-titre",
              initialValue: "Rennes - 00063 Koala kids",
            ),
            onPressed: context.knobs.boolean(
              label: "Peut changer",
              initialValue: false,
            )
                ? () {}
                : null,
          ),
        ],
        title: Text('Listo'),
        logo: AssetImage('assets/images/logo.png'),
      ),
      body: Container(
        color: ListoMainColors.primary.ultraLight,
      ),
    );
  }
}
