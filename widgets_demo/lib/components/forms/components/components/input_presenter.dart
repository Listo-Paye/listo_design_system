import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class InputPresenter extends StatefulWidget {
  const InputPresenter({super.key});

  @override
  State<InputPresenter> createState() => _InputPresenterState();
}

class _InputPresenterState extends State<InputPresenter> {
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
                  children: const [
                    SizedBox(height: Spacings.sm),
                    FormNote(
                      notes: [
                        Note(
                          label: "Exemple",
                          value: "Voici la liste des inputs disponibles",
                        ),
                      ],
                    ),
                    SizedBox(height: Spacings.md),
                    FormPanel(
                      title: "Saisie de texte",
                      children: [
                        InputText(hintText: "Texte"),
                        InputAmount(
                          hintText: "Montant",
                        ),
                        TextArea(hintText: "Commentaire"),
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
  }
}
