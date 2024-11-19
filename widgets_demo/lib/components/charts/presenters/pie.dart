import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent pieChart(BuildContext context) {
  return WidgetbookComponent(name: "Pie", useCases: [
    usercaseWithMarkdown(
      "Seule",
      (context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: ListoMainColors.primary.ultraLight,
          ),
          child: Padding(
              padding: const EdgeInsets.all(Spacings.md),
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
          color: ListoMainColors.primary.ultraLight,
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
                          color: ListoMainColors.primary.dark),
                      ChartPieItem(
                          value: 25,
                          title: 'Envoyé',
                          color: ListoMainColors.success.dark),
                      ChartPieItem(
                          value: 6,
                          title: 'Non calculé',
                          color: ListoMainColors.error.dark),
                      ChartPieItem(
                          value: 19,
                          title: 'En cours',
                          color: ListoMainColors.warning.dark),
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
