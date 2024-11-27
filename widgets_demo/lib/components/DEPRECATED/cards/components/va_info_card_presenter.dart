import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

class VaInfoCardPresenter extends StatelessWidget {
  const VaInfoCardPresenter({super.key});

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
            width: 511,
            child: VaInfoCard(
              onSelect: useVoid ? () {} : null,
              title: context.knobs.string(
                label: "Nom de la VA",
                initialValue: "brutCumuleGlissant12DerniersMois",
              ),
              value: context.knobs.double.input(
                label: "Montant",
                initialValue: 3264.28,
              ),
              type: context.knobs.list(
                label: "Type",
                options: VaInfoCardType.values,
                initialOption: VaInfoCardType.calculated,
                labelBuilder: (option) => option.name,
              ),
              subtitle: context.knobs.stringOrNull(
                label: 'Commentaire',
                initialValue:
                    'Commentaire expliquant la règle de calcul utilisé pour le montant saisie',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
