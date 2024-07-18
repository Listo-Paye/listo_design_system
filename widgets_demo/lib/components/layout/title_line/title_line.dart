import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent titleLine(BuildContext context) {
  return WidgetbookComponent(name: "TitleLine", useCases: [
    usercaseWithMarkdown(
      "With Dropdown",
      (context) {
        var title = context.knobs.string(
          label: 'Titre',
          initialValue: 'Établissement - Paramètres',
        );
        var label = context.knobs.string(
          label: 'Libellé',
          initialValue: 'Période',
        );
        List<({String id, String value})> values = [
          (id: "2024-07", value: "Juillet 2024 (En cours)"),
          (id: "2024-06", value: "Juin 2024"),
          (id: "2024-05", value: "Mai 2024"),
          (id: "2024-04", value: "Avril 2024"),
          (id: "2024-03", value: "Mars 2024"),
          (id: "2024-02", value: "Février 2024"),
        ];
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: ListoMainColors.primary.ultraLight,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Spacings.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLine(
                  title: title,
                  label: label,
                  selectedValue: values.first.value,
                  values: values,
                ),
              ],
            ),
          ),
        );
      },
      "markdown/title_line_combo.md",
    ),
    usercaseWithMarkdown(
      "With Label",
      (context) {
        var title = context.knobs.string(
          label: 'Titre',
          initialValue: 'Établissement - Paramètres',
        );
        var label = context.knobs.string(
          label: 'Libellé',
          initialValue: 'Année en cours',
        );
        var value = context.knobs.string(
          label: 'Valeur',
          initialValue: '2024',
        );
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: ListoMainColors.primary.ultraLight,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Spacings.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLine(
                  title: title,
                  label: label,
                  selectedValue: value,
                ),
              ],
            ),
          ),
        );
      },
      "markdown/title_line_label.md",
    ),
  ]);
}
