import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/listo_design_system.dart';

@Deprecated('Ce composant sera bientôt supprimé.')
class ClientCard extends ListoCard {
  final String nom;
  final DateTime dateDebut;
  final DateTime? dateFin;
  final String typeContrat;
  const ClientCard({
    super.key,
    required this.nom,
    required this.dateDebut,
    required this.typeContrat,
    this.dateFin,
    super.isSelected = false,
    super.chevron,
    super.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: isSelected ? SepteoColors.blue.shade200 : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      margin: EdgeInsets.zero,
      child: Semantics(
        label: getAllText(),
        button: true,
        child: InkWell(
          hoverColor: SepteoColors.blue.shade50,
          highlightColor: SepteoColors.blue.shade200,
          splashColor: SepteoColors.blue.shade200,
          borderRadius: BorderRadius.circular(4),
          onTap: onSelect,
          child: Padding(
            padding: const EdgeInsets.all(SepteoSpacings.xs),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nom,
                        overflow: TextOverflow.ellipsis,
                        style: SepteoTextStyles.bodySmallInterBold
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        label,
                        overflow: TextOverflow.ellipsis,
                        style: SepteoTextStyles.captionInter
                            .copyWith(color: SepteoColors.grey.shade500),
                      ),
                    ],
                  ),
                ),
                const RowSeparator(),
                Padding(
                  padding: const EdgeInsets.all(SepteoSpacings.xs),
                  child: Icon(
                    chevron,
                    color: SepteoColors.orange.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get label {
    List<String> labels = [
      DateFormat('dd/MM/yyyy').format(dateDebut),
    ];
    if (dateFin != null) {
      labels.add(DateFormat('dd/MM/yyyy').format(dateFin!));
    }
    labels.add(typeContrat);
    return labels.join(' - ');
  }

  @override
  String getAllText() => '$nom $label';
}
