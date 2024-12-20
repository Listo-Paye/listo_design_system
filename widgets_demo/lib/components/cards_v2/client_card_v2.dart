import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent clientCardV2(BuildContext context) {
  return WidgetbookComponent(name: "Client Card", useCases: [
    usercaseWithMarkdown("Client Card V2", (context) {
      final employee = EmployeeForAffiliationOc(
        nom: 'Norris Chuck',
        dateDebut: '01/01/2023',
        dateFin: '31/12/2023',
        type: 'CDD',
      );

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClientCardV2(
          employee: employee,
        ),
      );
    }, "markdown/client_card_v2.md"),
  ]);
}
