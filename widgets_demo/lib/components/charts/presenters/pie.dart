import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent pieChart(BuildContext context) {
  return WidgetbookComponent(name: "Classiques", useCases: [
    usercaseWithMarkdown(
      "Pie",
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
  ]);
}
