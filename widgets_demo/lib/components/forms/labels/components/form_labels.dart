import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'container.dart';

class FormLabels extends StatelessWidget {
  const FormLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      height: 350,
      child: FormList(
        children: [
          const FormLabel(
            hint: 'Hint',
            value: 'Value',
          ),
          FormPeriodLabel(
            hint: 'Période avec date de fin',
            startDate: DateTime.now().add(const Duration(days: -200)),
            endDate: DateTime.now(),
          ),
          FormPeriodLabel(
            hint: 'Période sans date de fin',
            startDate: DateTime.now().add(const Duration(days: -200)),
          ),
          const FormKeyValueList(hint: 'Liste de valeurs', values: {
            'Partie A': '50 %',
            'Partie B': '25 %',
            'Partie C': '25%',
          }),
        ],
      ),
    );
  }
}
