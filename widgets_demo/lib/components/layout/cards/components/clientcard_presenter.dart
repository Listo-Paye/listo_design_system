import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class ClientCardPresenter extends StatelessWidget {
  const ClientCardPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    var useVoid =
        context.knobs.boolean(label: "Clickable", initialValue: false);
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF808d90),
      ),
      child: Center(
        child: SizedBox(
          width: 411,
          child: ClientCard(
            onSelect: useVoid ? () {} : null,
            nomPrenomContrat: context.knobs.string(
              label: "Nom et prénom du contrat",
              initialValue: "Nom Prénom contrat",
            ),
            dateDebut: context.knobs.dateTime(
              label: "Date de début de contrat",
              initialValue: DateTime.now(),
              start: DateTime(2001),
              end: DateTime.now(),
            ),
            typeContrat: context.knobs.string(
              label: "Type de contrat",
              initialValue: "CDI",
            ),
          ),
        ),
      ),
    );
  }
}
