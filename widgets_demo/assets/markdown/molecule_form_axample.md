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
          color: ListoMainColors.primary.light,
          borderRadius: BorderRadius.circular(Spacings.xs),
        ),
        child: Center(
          child: SizedBox(
            width: 411,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.all(Spacings.sm),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Spacings.xs,
                  horizontal: Spacings.md,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: Spacings.sm),
                    const FormTitle(data: "PMSS salarié"),
                    const SizedBox(height: Spacings.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const AmountTitle(amount: 3864),
                        const SizedBox(width: Spacings.sm),
                        VaInfoCardType.calculated.toTag(large: true),
                      ],
                    ),
                    const SizedBox(height: Spacings.sm),
                    const FormNote(
                      label: "Règle de calcul",
                      value: "PMSS Légal * coefficient de proratisation",
                    ),
                    const SizedBox(height: Spacings.md),
                    const FormPanel(
                      title: "Modifier la variable",
                      children: [
                        InputAmount(
                          hintText: "Montant",
                        ),
                        TextArea(hintText: "Commentaire"),
                      ],
                    ),
                    const SizedBox(height: Spacings.sm),
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                            onPressed: () {},
                            text: "Fermer",
                            style: ButtonType.secondary,
                          ),
                        ),
                        const SizedBox(width: Spacings.sm),
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
