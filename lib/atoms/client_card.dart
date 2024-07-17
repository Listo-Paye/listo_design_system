import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ClientCard extends StatelessWidget {
  final String nomPrenomContrat;
  final DateTime dateDebut;
  final String typeContrat;
  final void Function()? onSelect;
  const ClientCard({
    super.key,
    required this.nomPrenomContrat,
    required this.dateDebut,
    required this.typeContrat,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: InkWell(
        hoverColor: ListoMainColors.primary.ultraLight,
        highlightColor: ListoMainColors.primary.light,
        splashColor: ListoMainColors.primary.light,
        onTap: onSelect,
        child: Padding(
          padding: const EdgeInsets.all(Spacings.xs),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nomPrenomContrat,
                        style: TextStyles.bodyMediumSemibold
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        '${DateFormat('dd/MM/yyyy').format(dateDebut)} / $typeContrat',
                        style: TextStyles.bodySmall
                            .copyWith(color: ListoMainColors.neutral.shade500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: Spacings.xs,
                ),
                const Padding(
                  padding: EdgeInsets.all(Spacings.xs),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
