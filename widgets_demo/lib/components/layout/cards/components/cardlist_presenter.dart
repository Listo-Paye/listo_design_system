import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/atoms_module.dart';
import 'package:listo_design_system/molecules/card_list/card_list.dart';
import 'package:widgetbook/widgetbook.dart';

class CardlistPresenter extends StatelessWidget {
  const CardlistPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return CardList(
      searchHintText: context.knobs.string(
        label: "Hint de recherche",
        initialValue: "Rechercher Client",
      ),
      children: [
        ClientCard(
          nomPrenomContrat: "FONTAINE Benoît Tech Lead",
          dateDebut: DateTime(2023, 10, 16),
          typeContrat: "CDI",
          onSelect: () {},
        ),
        ClientCard(
          nomPrenomContrat: "SEMERIA Thomas Ingénieur Logiciel",
          dateDebut: DateTime(2022, 07, 11),
          typeContrat: "CDI",
          onSelect: () {},
        ),
        ClientCard(
          nomPrenomContrat: "HUIBAN Raphael Développeur",
          dateDebut: DateTime(2024, 04, 1),
          typeContrat: "CDI",
          onSelect: () {},
        ),
      ],
    );
  }
}
