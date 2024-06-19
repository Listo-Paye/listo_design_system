import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent dataTableMolecule(BuildContext context) {
  return WidgetbookComponent(
    name: 'Data Table',
    useCases: [
      usercaseWithMarkdown('Data Table', (context) {
        final label = context.knobs.string(
          label: 'Text',
          initialValue: 'DataTable',
        );

        return ListoDataTable();
      }, "markdown/molecule_data_table.md"),
    ],
  );
}
