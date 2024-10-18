import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:widgets_demo/use_case_with_markdown.dart';

enum VaType {
  calculated,
  fixed,
}

WidgetbookComponent allInOneComponent(BuildContext context) {
  return WidgetbookComponent(name: "Exemple", useCases: [
    usercaseWithMarkdown(
      "Exemple",
      (context) {
        var type = context.knobs.list(
          label: "Type de variable",
          options: [
            "Variable saisie",
            "Variable calculée",
          ],
        );

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
                            if (type == "Variable calculée")
                              VaInfoCardType.calculated.toTag(large: true),
                            if (type == "Variable saisie")
                              VaInfoCardType.manual.toTag(large: true),
                          ],
                        ),
                        if (type == "Variable calculée") ...[
                          const SizedBox(height: Spacings.sm),
                          const FormNote(
                            notes: [
                              Note(
                                label: "Règle de calcul",
                                value:
                                    "PMSS Légal * coefficient de proratisation",
                              ),
                            ],
                          ),
                        ],
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
                        if (type == "Variable saisie") ...[
                          const SizedBox(height: Spacings.sm),
                          FormNote(
                            title: "Variable calculée",
                            notes: const [
                              Note(
                                label: "Montant d'origine",
                                value: "3264,28 €",
                              ),
                              Note(
                                label: "Règle de calcul",
                                value:
                                    "PMSS Légal * coefficient de proratisation",
                              ),
                            ],
                            action: FormNoteAction(
                              label: "Rétablir la variale calculée",
                              // ignore: avoid_print
                              onPressed: () => print("FormNote action pressed"),
                            ),
                          ),
                        ],
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      "markdown/molecule_form_axample.md",
    ),
  ]);
}
