import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class AdaptiveMdPresenter extends StatefulWidget {
  const AdaptiveMdPresenter({super.key});

  @override
  State<AdaptiveMdPresenter> createState() => _AdaptiveMdPresenterState();
}

class _AdaptiveMdPresenterState extends State<AdaptiveMdPresenter> {
  List<Widget> columns = [];

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
          child: AdaptiveMdd(
            first: ClientCardList(
              onClick: (np, ct, dt, df, typ) {
                var retour = ClientCard(
                  nom: np,
                  contrat: ct,
                  dateDebut: dt,
                  dateFin: df,
                  typeContrat: typ,
                  chevron: Icons.close,
                  onSelect: () {
                    setState(() {
                      columns = [];
                    });
                  },
                );
                setState(() {
                  columns = [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        retour,
                        const SizedBox(height: 8),
                        const Expanded(child: VarAppCardList()),
                      ],
                    )
                  ];
                });
              },
            ),
            others: [...columns],
          ),
        ),
      ),
    );
  }
}

class ClientCardList extends StatelessWidget {
  void Function(
    String nomPrenom,
    String contrat,
    DateTime dateDebut,
    DateTime? dateFin,
    String typeContrat,
  ) onClick;
  ClientCardList({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return CardList(
      searchHintText: "Rechercher kk1",
      children: [
        ClientCard(
          nom: "FONTAINE Benoît",
          contrat: "Tech Lead",
          dateDebut: DateTime(2023, 10, 16),
          typeContrat: "CDI",
          onSelect: () {
            onClick(
              "FONTAINE Benoît",
              "Tech Lead",
              DateTime(2023, 10, 16),
              null,
              "CDI",
            );
          },
        ),
        ClientCard(
          nom: "SEMERIA Thomas",
          contrat: "Ingénieur Logiciel",
          dateDebut: DateTime(2022, 07, 11),
          dateFin: DateTime(2024, 12, 31),
          typeContrat: "CDI",
          onSelect: () {
            onClick(
              "SEMERIA Thomas",
              "Ingénieur Logiciel",
              DateTime(2022, 07, 11),
              DateTime(2024, 12, 31),
              "CDD",
            );
          },
        ),
        ClientCard(
          nom: "HUIBAN Raphael",
          contrat: "Développeur",
          dateDebut: DateTime(2024, 04, 1),
          typeContrat: "CDI",
          onSelect: () {
            onClick(
              "HUIBAN Raphael",
              "Développeur",
              DateTime(2024, 04, 1),
              null,
              "CDI",
            );
          },
        ),
      ],
    );
  }
}

class VarAppCardList extends StatelessWidget {
  const VarAppCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardList(
      searchHintText: "Rechercher variable",
      children: [
        VaInfoCard(
            title: 'Ma variable Applicative 1',
            value: 817.2,
            type: VaInfoCardType.calculated),
        VaInfoCard(
            title: 'VA Personnel',
            value: 817.2,
            type: VaInfoCardType.calculated),
        VaInfoCard(
            title: 'PMSS', value: 817.2, type: VaInfoCardType.calculated),
        VaInfoCard(
            title: 'Lorem Ipsum',
            value: 817.2,
            type: VaInfoCardType.calculated),
        VaInfoCard(
            title: 'Ma variable Applicative 2',
            value: 817.2,
            type: VaInfoCardType.calculated),
      ],
    );
  }
}
