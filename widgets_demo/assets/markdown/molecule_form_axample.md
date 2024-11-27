# Code source 
```dart
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class AllInOne extends StatelessWidget {
  const AllInOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          color: SepteoColors.blue.shade200,
          borderRadius: BorderRadius.circular(SepteoSpacings.xs),
        ),
        child: Center(
          child: SizedBox(
            width: 411,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.all(SepteoSpacings.md),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: SepteoSpacings.xs,
                  horizontal: SepteoSpacings.xl,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: SepteoSpacings.md),
                    const FormTitle(data: "PMSS salarié"),
                    const SizedBox(height: SepteoSpacings.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const AmountTitle(amount: 3864),
                        const SizedBox(width: SepteoSpacings.md),
                        VaInfoCardType.calculated.toTag(large: true),
                      ],
                    ),
                    const SizedBox(height: SepteoSpacings.md),
                    const FormNote(
                      label: "Règle de calcul",
                      value: "PMSS Légal * coefficient de proratisation",
                    ),
                    const SizedBox(height: SepteoSpacings.xl),
                    const FormPanel(
                      title: "Modifier la variable",
                      children: [
                        InputAmount(
                          hintText: "Montant",
                        ),
                        TextArea(hintText: "Commentaire"),
                      ],
                    ),
                    const SizedBox(height: SepteoSpacings.md),
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                            onPressed: () {},
                            text: "Fermer",
                            style: ButtonType.secondary,
                          ),
                        ),
                        const SizedBox(width: SepteoSpacings.md),
                        Expanded(
                          child: Button(
                            onPressed: () {},
                            text: "Enregistrer",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

```
