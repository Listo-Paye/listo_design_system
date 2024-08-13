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
              onClick: (np, dt, typ) {
                var retour = ClientCard(
                  nomPrenomContrat: np,
                  dateDebut: dt,
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
    DateTime dateDebut,
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
          nomPrenomContrat: "FONTAINE Benoît Tech Lead",
          dateDebut: DateTime(2023, 10, 16),
          typeContrat: "CDI",
          onSelect: () {
            onClick("FONTAINE Benoît", DateTime(2023, 10, 16), "CDI");
          },
        ),
        ClientCard(
          nomPrenomContrat: "SEMERIA Thomas Ingénieur Logiciel",
          dateDebut: DateTime(2022, 07, 11),
          typeContrat: "CDI",
          onSelect: () {
            onClick("SEMERIA Thomas", DateTime(2022, 07, 11), "CDI");
          },
        ),
        ClientCard(
          nomPrenomContrat: "HUIBAN Raphael Développeur",
          dateDebut: DateTime(2024, 04, 1),
          typeContrat: "CDI",
          onSelect: () {
            onClick("HUIBAN Raphael", DateTime(2024, 04, 1), "CDI");
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
