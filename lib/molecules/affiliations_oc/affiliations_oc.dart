import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/affiliations_oc/employee.dart';

import 'contrat_entity.dart';

class AffiliationsOc extends StatelessWidget {
  final EmployeeData employee;
  final List<ContratsOcdata> organismesComplementaires;

  const AffiliationsOc({
    super.key,
    required this.employee,
    required this.organismesComplementaires,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Affiliations OC',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
