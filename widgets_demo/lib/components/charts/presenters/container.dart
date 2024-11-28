import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent containerChart(BuildContext context) {
  return WidgetbookComponent(name: "Cadre", useCases: [
    usercaseWithMarkdown(
      "Pie",
      (context) {
        return Container(
          color: SepteoColors.blue.shade50,
          child: Center(
            child: SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ChartContainer(
                    buttonText: "Export des bulletins (17)",
                    buttonIcon: Icon(Icons.file_download_outlined),
                    onButtonPressed: () {},
                    title: "Etat des bulletins",
                    child: ChartPie(items: [
                      ChartPieItem(
                          value: 50,
                          title: 'Calculé',
                          color: SepteoColors.blue.shade600),
                      ChartPieItem(
                          value: 25,
                          title: 'Envoyé',
                          color: SepteoColors.green.shade600),
                      ChartPieItem(
                          value: 6,
                          title: 'Non calculé',
                          color: SepteoColors.red.shade600),
                      ChartPieItem(
                          value: 19,
                          title: 'En cours',
                          color: SepteoColors.orange.shade600),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      "markdown/charts_container_pie.md",
    ),
    usercaseWithMarkdown(
      "Chiffres clé",
      (context) {
        return Container(
          color: SepteoColors.blue.shade50,
          child: Center(
            child: SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ChartContainer(
                    buttonText: "Exporter les contrats (17)",
                    buttonIcon: Icon(Icons.file_download_outlined),
                    onButtonPressed: () {},
                    title: "Contrats",
                    child: ChiffreCleRow(items: [
                      ChiffreCleItem(chiffre: 17, label: 'Salariés'),
                      ChiffreCleItem(chiffre: 12, label: 'CDI'),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      "markdown/charts_container_indicateurs.md",
    ),
    usercaseWithMarkdown(
      "Second bouton",
      (context) {
        return Container(
          color: SepteoColors.blue.shade50,
          child: Center(
            child: SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ChartContainer(
                    buttonText: "Export des bulletins (17)",
                    buttonIcon: Icon(Icons.file_download_outlined),
                    onButtonPressed: () {},
                    secondaryButtonIcon: Icon(Icons.undo),
                    onSecondaryButtonPressed: () {},
                    secondaryButtonText: "Annuler",
                    title: "Etat des bulletins",
                    child: ChartPie(items: [
                      ChartPieItem(
                          value: 50,
                          title: 'Calculé',
                          color: SepteoColors.blue.shade600),
                      ChartPieItem(
                          value: 25,
                          title: 'Envoyé',
                          color: SepteoColors.green.shade600),
                      ChartPieItem(
                          value: 6,
                          title: 'Non calculé',
                          color: SepteoColors.red.shade600),
                      ChartPieItem(
                          value: 19,
                          title: 'En cours',
                          color: SepteoColors.orange.shade600),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      "markdown/charts_container_pie_second_button.md",
    ),
  ]);
}
