import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listo_design_system/listo_design_system.dart';

class AdaptiveMdPresenter extends StatelessWidget {
  const AdaptiveMdPresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ListoMainColors.primary.light,
        borderRadius: BorderRadius.circular(Radiuses.xs),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 400,
          child: AdaptiveMasterDetails(
            child: CardList(
              searchHintText: "Rechercher kk1",
              children: [
                ClientCardInList(
                  nomPrenomContrat: "FONTAINE Benoît Tech Lead",
                  dateDebut: DateTime(2023, 10, 16),
                  typeContrat: "CDI",
                ),
                ClientCardInList(
                  nomPrenomContrat: "SEMERIA Thomas Ingénieur Logiciel",
                  dateDebut: DateTime(2022, 07, 11),
                  typeContrat: "CDI",
                ),
                ClientCardInList(
                  nomPrenomContrat: "HUIBAN Raphael Développeur",
                  dateDebut: DateTime(2024, 04, 1),
                  typeContrat: "CDI",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientCardInList extends ListoCard {
  final String nomPrenomContrat;
  final DateTime dateDebut;
  final String typeContrat;
  const ClientCardInList({
    super.key,
    required this.nomPrenomContrat,
    required this.dateDebut,
    required this.typeContrat,
  });

  @override
  Widget build(BuildContext context) {
    return ClientCard(
      nomPrenomContrat: nomPrenomContrat,
      dateDebut: dateDebut,
      typeContrat: typeContrat,
      onSelect: () {
        AdaptiveMasterDetails.navigate(
            context,
            (context) => Expanded(
                  child: CardListSelected(
                    nomPrenomContrat: nomPrenomContrat,
                    dateDebut: dateDebut,
                    typeContrat: typeContrat,
                  ),
                ));
      },
    );
  }

  @override
  String getAllText() =>
      '$nomPrenomContrat ${DateFormat('dd/MM/yyyy').format(dateDebut)} / $typeContrat';
}

class CardListSelected extends StatelessWidget {
  final String nomPrenomContrat;
  final DateTime dateDebut;
  final String typeContrat;
  const CardListSelected({
    super.key,
    required this.nomPrenomContrat,
    required this.dateDebut,
    required this.typeContrat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: ClientCard(
            nomPrenomContrat: nomPrenomContrat,
            dateDebut: dateDebut,
            typeContrat: typeContrat,
            chevron: Icons.close,
            onSelect: () {
              AdaptiveMasterDetails.pop(context);
              AdaptiveMasterDetails.pop(context);
            },
          ),
        ),
        const SizedBox(height: Spacings.xs),
        CardList(
          searchHintText: "Rechercher",
          children: [
            VaInfoCard(
              title: "brutCumuleGlissant12DerniersMois",
              value: 3825.28,
              type: VaInfoCardType.calculated,
              onSelect: () {
                AdaptiveMasterDetails.show(
                    context,
                    (context) => const Expanded(
                          child: Center(child: Text("Bien joué !")),
                        ));
              },
            ),
          ],
        ),
      ],
    );
  }
}
