import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class LibelleSeulCard extends ListoCard {
  final String libelle;
  const LibelleSeulCard({
    super.key,
    super.chevron = Icons.chevron_right,
    super.isSelected = false,
    super.onSelect,
    required this.libelle,
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
                      Tooltip(
                        message: libelle,
                        child: Text(
                          libelle,
                          overflow: TextOverflow.ellipsis,
                          style: SepteoTextStyles.bodySmallInterBold
                              .copyWith(color: Colors.black),
                        ),
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

  @override
  String getAllText() {
    return libelle;
  }
}
