import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/listo_design_system.dart';

class ClientCard extends ListoCard {
  final String nomPrenomContrat;
  final DateTime dateDebut;
  final String typeContrat;
  const ClientCard({
    super.key,
    required this.nomPrenomContrat,
    required this.dateDebut,
    required this.typeContrat,
    super.chevron,
    super.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: isSelected ? ListoMainColors.primary.light : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      margin: EdgeInsets.zero,
      child: Semantics(
        label: getAllText(),
        button: true,
        child: InkWell(
          hoverColor: ListoMainColors.primary.ultraLight,
          highlightColor: ListoMainColors.primary.light,
          splashColor: ListoMainColors.primary.light,
          borderRadius: BorderRadius.circular(4),
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
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.bodyMediumSemibold
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          '${DateFormat('dd/MM/yyyy').format(dateDebut)} / $typeContrat',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.bodySmall.copyWith(
                              color: ListoMainColors.neutral.shade500),
                        ),
                      ],
                    ),
                  ),
                  const RowSeparator(),
                  Padding(
                    padding: const EdgeInsets.all(Spacings.xs),
                    child: Icon(
                      chevron,
                      color: ListoMainColors.secondary.base,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String getAllText() =>
      '$nomPrenomContrat ${DateFormat('dd/MM/yyyy').format(dateDebut)} / $typeContrat';
}
