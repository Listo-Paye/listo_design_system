import 'package:flutter/material.dart';
import 'package:listo_design_system/atoms/atoms_module.dart';
import 'package:listo_design_system/molecules/card_list/card_list.dart';
import 'package:widgetbook/widgetbook.dart';

class CardlistPresenter extends StatelessWidget {
  final bool isLoading;
  CardlistPresenter({
    super.key,
    required this.isLoading,
  });

  final cards = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return CardList<ClientCard>(
      searchHintText: context.knobs.string(
        label: "Hint de recherche",
        initialValue: "Rechercher Client",
      ),
      children: isLoading ? [] : cards,
    );
  }
}
