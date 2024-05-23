import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/alert.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../use_case_with_markdown.dart';

WidgetbookComponent alertsAtom(BuildContext context) {
  return WidgetbookComponent(name: "Alertes", useCases: [
    usercaseWithMarkdown(
      "Alertes",
      (context) => const AlertsPresenter(),
      "markdown/atome_alert.md",
    ),
  ]);
}

class AlertsPresenter extends StatelessWidget {
  const AlertsPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ErrorAlert(
              text: context.knobs
                  .string(label: "Texte Erreur", initialValue: "Erreur")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SuccessAlert(
              text: context.knobs
                  .string(label: "Texte Succès", initialValue: "Sucess")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WarningAlert(
              text: context.knobs
                  .string(label: "Texte Warning", initialValue: "Warning")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InfoAlert(
              text: context.knobs
                  .string(label: "Texte Info", initialValue: "Warning")),
        ),
      ],
    );
  }
}
