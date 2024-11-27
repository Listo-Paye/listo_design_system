import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class ClientCardPresenter extends StatelessWidget {
  const ClientCardPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    var useVoid =
        context.knobs.boolean(label: "Clickable", initialValue: false);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: SepteoColors.blue.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SizedBox(
            width: 411,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClientCard(
                  onSelect: useVoid ? () {} : null,
                  nom: context.knobs.string(
                    label: "Nom et prénom",
                    initialValue: "Nom Prénom",
                  ),
                  dateDebut: context.knobs.dateTime(
                    label: "Date de début de contrat",
                    initialValue: DateTime.now(),
                    start: DateTime(2001),
                    end: DateTime.now(),
                  ),
                  dateFin: context.knobs.dateTimeOrNull(
                    label: "Date de fin de contrat",
                    start: DateTime(2001),
                    end: DateTime.now(),
                    initialValue: null,
                  ),
                  typeContrat: context.knobs.string(
                    label: "Type de contrat",
                    initialValue: "CDI",
                  ),
                  isSelected: context.knobs.boolean(
                    label: "Sélectionné",
                    initialValue: false,
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
