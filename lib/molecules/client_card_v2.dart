import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:listo_design_system/molecules/affiliations_oc/employee.dart';

class ClientCardV2 extends StatelessWidget {
  final EmployeeData employee;

  const ClientCardV2({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    final employee = EmployeeData(
      nom: 'Norris',
      prenom: 'Chuck',
      dateDebut: '01/01/2023',
      dateFin: '31/12/2023',
      type: 'CDD',
    );
    return Semantics(
      label:
          '${employee.nom} ${employee.prenom}, Contrat : ${employee.type}, du ${employee.dateDebut} au ${employee.dateFin}',
      child: SizedBox(
        height: 62,
        child: Card(
          color: SepteoColors.grey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
          ),
          child: Padding(
            padding: const EdgeInsets.all(SepteoSpacings.xs),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    '${employee.nom} ${employee.prenom}',
                    style: SepteoTextStyles.bodySmallInter.copyWith(
                        fontWeight: FontWeight.w600,
                        color: SepteoColors.grey.shade900),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    '${employee.dateDebut} - ${employee.dateFin} - ${employee.type}',
                    style: SepteoTextStyles.captionInter.copyWith(
                        fontWeight: FontWeight.w400,
                        color: SepteoColors.grey.shade500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
