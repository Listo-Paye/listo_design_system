import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent pieChart(BuildContext context) {
  return WidgetbookComponent(name: "Pie", useCases: [
    usercaseWithMarkdown(
      "Seul",
      (context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: SepteoColors.blue.shade50,
          ),
          child: Padding(
              padding: const EdgeInsets.all(SepteoSpacings.xl),
              child: Center(
                child: ChartPie(items: [
                  ChartPieItem(
                    value: 19.3,
                    title: 'Title 1',
                  ),
                  ChartPieItem(
                    value: 30,
                    title: 'Title 2',
                  ),
                  ChartPieItem(
                    value: 50.7,
                    title: 'Title 3',
                  ),
                ]),
              )),
        );
      },
      "markdown/charts_pie.md",
    ),
    usercaseWithMarkdown(
      "Contenu",
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
  ]);
}
