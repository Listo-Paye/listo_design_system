import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent titleLine(BuildContext context) {
  return WidgetbookComponent(name: "TitleLine", useCases: [
    usercaseWithMarkdown(
      "Legacy",
      (context) {
        var title = context.knobs.string(
          label: 'Titre',
          initialValue: 'Établissement - Paramètres',
        );
        var label = context.knobs.stringOrNull(
          label: 'Libellé',
          initialValue: 'Année en cours',
        );
        var value = context.knobs.stringOrNull(
          label: 'Valeur',
          initialValue: '2024',
        );
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: SepteoColors.blue.shade50,
          ),
          child: Padding(
            padding: const EdgeInsets.all(SepteoSpacings.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLine(
                  title: title,
                  label: label ?? "",
                  selectedValue: value ?? "",
                  actions: [
                    SizedBox(
                      width: 100,
                      child: Button(
                        onPressed: () {},
                        text: 'Submit',
                      ),
                    ),
                  ],
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
