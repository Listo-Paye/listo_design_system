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
                  children: const [
                    SizedBox(height: SepteoSpacings.md),
                    FormNote(
                      notes: [
                        Note(
                          label: "Exemple",
                          value: "Voici la liste des inputs disponibles",
                        ),
                      ],
                    ),
                    SizedBox(height: SepteoSpacings.xl),
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
